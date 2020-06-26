# THREAD TESTS
require 'minitest/autorun'

# custom libs
require_relative '../lib/search/search_client'
require_relative '../lib/parse/parse_results'
require_relative '../lib/threaded_operations/threaded_get'

class ThreadTest < Minitest::Test
  full_name_query = "jane+smith"
  query           = SearchClient.new(full_name_query)
  query_result    = query.search()
  pr              = ParseResults.new(query_result.body)
  # class scope for thie re-used hash
  @@all_links       = pr.parse

  # let's make sure the first result is valid
  def test_threaded_get_requests
    queries = @@all_links['search_queries']
    threader = ThreadedGet.new(queries)
    results = threader.go
    assert results[0]['direct'].length >= 1
  end

end
