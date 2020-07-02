# frozen_string_literal: true

# encapsulate search and parse into a threaded operation that fits in our pool
class ThreadedGetParse
  require_relative '../thread_pool'
  require 'logger'

  require_relative '../search/search_client'
  require_relative '../all_links_producer'

  def initialize(query, search_engines)
    @query            = query
    @search_engines   = search_engines
  end

  # Logger#debug, Logger#info, Logger#warn, Logger#error, and Logger#fatal
  work_dir = '/var/log/findme'
  begin
    $LOG = Logger.new("#{work_dir}/findme.log", 10, 1_024_000)
  rescue StandardError => e
    puts "unable to write to #{work_dir}/findme.log ... writing to stdout"
    $LOG = Logger.new($stderr)
  end

  # $LOG       = Logger.new($stderr)
  # $LOG.level = Logger::DEBUG
  $LOG.level  = Logger::INFO
  # $LOG.level  = Logger::ERROR

  def go
    multi_query_results = {}
    @pool = ThreadPool.new
    @search_engines.each do |search_engine|
      @pool.dispatch do
        $LOG.debug("search engine is #{search_engine}")
        $LOG.debug("running query: #{@query}")
        query_client                = SearchClient.new(@query)
        query_client.search_engine  = search_engine
        query_result                = query_client.search
        $LOG.debug('----------- query result ------------')
        $LOG.debug(query_result)
        # parse according to each search engine's specific requirements
        producer = AllLinksProducer.new(query_result, search_engine)
        all_links = producer.supply
        $LOG.info('----------- parse result ------------')
        $LOG.info(all_links)
        multi_query_results["#{search_engine}"] = all_links
      end
    end
    @pool.shutdown
    multi_query_results
  end
end
