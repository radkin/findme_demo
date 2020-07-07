# frozen_string_literal: true

# THREAD TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../../lib/threaded_operations/threaded_get_parse'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ThreadSearchEnginesRestTest < Minitest::Test
  # let's make sure the first result is valid
  def test_threaded_get_requests
    full_name_query = 'jane+smith'
    search_engines  = %w[startpage bing google]
    threaded_get = ThreadedGetParse.new(full_name_query, search_engines)
    multi_query_results = threaded_get.go
    # these are GET requests and fully parsed links
    one_result = multi_query_results[search_engines[0]]
    assert one_result.length >= 1
    # should return results from google direct links
    assert one_result['direct'].length >= 1
    # should return a hash that uses a search engine for a key
    assert multi_query_results['bing'].length >= 1
  end
end
