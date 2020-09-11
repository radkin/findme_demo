#!/usr/bin/env jruby
# frozen_string_literal: true

require 'logger'

# custom libs
require_relative '../lib/user_provided_information'
require_relative '../lib/search/search_query'
require_relative '../lib/threaded_operations/threaded_get_parse'
require_relative '../lib/common'

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
  # $LOG.level = Logger::DEBUG
  $LOG.level = Logger::INFO
  # $LOG.level  = Logger::ERROR

  def main
    ### step1
    $LOG.info('gathering user provided information')
    @user_pi            = UserProvidedInformation.new.import_PI
    type                = 'full_name_query'
    search_query        = SearchQuery.new(@user_pi, type)
    full_name_query     = search_query.construct
    # step2
    search_engines      = %w[startpage bing google]
    threaded_get        = ThreadedGetParse.new(full_name_query, search_engines)
    multi_query_results = threaded_get.go
    multi_query_results
    # NOT READY FOR THIS!
    #     # step3
    #     common                       = Common.new
    #     common.raw_multi_query_links = multi_query_results
    #     deduped                      = common.dedupe
    #     deduped
  end
end

findme = Findme.new
findme.main
