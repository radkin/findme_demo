#!/usr/bin/env jruby
# frozen_string_literal: true

require_relative '../lib/user_provided_information'

# custom libs
require_relative '../lib/search/search_client'
require_relative '../lib/search/search_query'
require_relative '../lib/parse/parse_results'
require_relative '../lib/threaded_operations/threaded_get'

require 'logger'

# Find web results that are an invasion of your privacy
class Findme
  # Logger#debug, Logger#info, Logger#warn, Logger#error, and Logger#fatal
  work_dir = '/var/log/findme'
  begin
    $LOG = Logger.new("#{work_dir}/findme.log", 10, 1_024_000)
  rescue StandardError => e
    puts "unable to write to #{work_dir}/findme.log ... writing to stdout"
    $LOG = Logger.new($stderr)
  end

  # $LOG       = Logger.new($stderr)
  $LOG.level = Logger::DEBUG
  # $LOG.level = Logger::INFO
  # $LOG.level  = Logger::ERROR

  def main
    ### step1
    $LOG.info('gathering user provided information')
    @user_pi = UserProvidedInformation.new.import_PI
    type = 'full_name_query'
    search_query = SearchQuery.new(@user_pi, type)
    full_name_query = search_query.construct
    # step2
    $LOG.info('running query')
    query           = SearchClient.new(full_name_query)
    query_result    = query.search
    ### step3
    $LOG.info('parsing query results')
    # common parser processing
    parser              = Parser.new(query_result.body)
    links               = parser.gather_raw_links
    # using google as our search engine
    google         = Google.new(links)
    direct_links   = google.gather_direct_links
    search_queries = google.gather_search_queries
    all_links = {
      'direct'          => direct_links,
      'search_queries'  => search_queries
    }
    ### step4
    $LOG.info('running search engine recommended searches')
    queries = all_links['search_queries']
    threader = ThreadedGet.new(queries)
    threader.go
  end
end

findme = Findme.new
findme.main
