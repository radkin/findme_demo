class ThreadedGet

  require 'thread'

  def initialize(link)
    @link = link
  end

  def get(link)
    Thread.new do
      begin
        alive           = true # determines whether or not to keep running

        $LOG.info("starting work")
        alive = true
        while alive
          $LOG.debug("following a links")
        end # while alive
      rescue StandardError => e
        $LOG.error e
        retry
      end
    end # Thread
  end # go

end
