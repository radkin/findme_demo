# frozen_string_literal: true

# encapsulate search and parse into a threaded operation that fits in our pool
class ThreadedGet
  require_relative '../thread_pool'
  require 'logger'

  require_relative '../search/search_client'
  require_relative '../parse/parse_results'

  def initialize(queries)
    @queries = queries
  end

  # Logger#debug, Logger#info, Logger#warn, Logger#error, and Logger#fatal
  work_dir = '/var/log/findme'
  begin
    $LOG = Logger.new("#{work_dir}/findme.log", 10, 1_024_000)
  rescue Exception => e
    puts "unable to write to #{work_dir}/findme.log ... writing to stdout"
    $LOG = Logger.new($stderr)
  end

  # $LOG       = Logger.new($stderr)
  $LOG.level = Logger::DEBUG
  # $LOG.level  = Logger::INFO
  # $LOG.level  = Logger::ERROR

  def go
    all_links = []
    @pool = ThreadPool.new
    @queries.each do |query|
      @pool.dispatch do
        $LOG.debug("running query #{query}")
        query_client    = SearchClient.new(query)
        query_result    = query_client.search
        pr              = ParseResults.new(query_result.body)
        result          = pr.parse_google
        all_links.push(result)
        $LOG.debug(result)
      end
    end
    @pool.shutdown
    all_links
  end
end
