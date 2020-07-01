# frozen_string_literal: true

# THREAD TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../lib/search/search_client'
require_relative '../lib/parse/parse_results'
require_relative '../lib/threaded_operations/threaded_get'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ThreadTest < Minitest::Test
  # let's make sure the first result is valid
  def test_threaded_get_requests
    full_name_query = 'jane+smith'
    # search_engines = %w[bing yandex yahoo startpage duckduckgo
    #                     baidu searchencrypt gigablast]

    # no search_links STARTPAGE , so not testing it
    search_engines  = %w[bing google]
    query           = SearchClient.new(full_name_query)
    query_result    = query.search

    pr = ParseResults.new(query_result.body)

    search_engines.each do |search_engine|
      puts "testing #{search_engine}"
      all_links = []
      case search_engine
      when 'google'
        all_links = pr.parse_google
      when 'bing'
        all_links = pr.parse_bing
      when 'startpage'
        all_links = pr.parse_startpage
      else
        raise 'search engine undefined'
      end
      # startpage has no search links
      queries = all_links['search_queries']
      threader = ThreadedGet.new(queries)
      results = threader.go
      assert results[0]['direct'].length >= 1
    end
  end
end
