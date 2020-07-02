# frozen_string_literal: true

# THREAD TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../lib/threaded_operations/threaded_get'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ThreadTestSearchEnginesRest < Minitest::Test
  # let's make sure the first result is valid
  def test_threaded_get_requests
    full_name_query = 'jane+smith'
    search_engines  = %w[bing google startpage]
    threaded_get = ThreadedGet.new(full_name_query, search_engines)
    multi_search_engine_query_results = threaded_get.go
    assert multi_search_engine_query_results.length >= 1
  end
end
