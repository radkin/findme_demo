# class ThreadPool keeps track of threads so we can keep them to a manageable size
class ThreadPool
  def initialize
    @pool = []
    @max_size = 18
    @pool_mutex = Mutex.new
    @pool_cv = ConditionVariable.new
  end
  # def dispatch actually manages our threads so the pool remains max size and no larger. In reality, the pool does get bigger, but it the only active thread will be max_size
  def dispatch(*args)
    Thread.new(sleep 1) do
      # Wait for space in the pool.
      @pool_mutex.synchronize do
        $LOG.debug("Pool is presently #{@pool.size}")
        while @pool.size >= @max_size
          print "Pool is full; waiting to run #{args.join(',')}...\n" if $DEBUG
          # Sleep until some other thread calls @pool_cv.signal.
          @pool_cv.wait(@pool_mutex)
        end
      end
    @pool << Thread.current
    begin
    yield(*args)
      rescue => e
        exception(self, e, *args)
      ensure
        @pool_mutex.synchronize do
          # Remove the thread from the pool.
          @pool.delete(Thread.current)
          # Signal the next waiting thread that there's a space in the pool.
          @pool_cv.signal
        end
      end
    end
  end
  # def shutdown makes sure all the threads in our pool are done before we complete the loop
  def shutdown
    @pool_mutex.synchronize { @pool_cv.wait(@pool_mutex) until @pool.empty? }
  end

  def exception(thread, exception, *original_args)
    # Subclass this method to handle an exception within a thread.
    puts "Exception in thread #{thread}: #{exception}"
  end

end
 
