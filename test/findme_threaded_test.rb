# THREAD TESTS
require 'minitest/autorun'
require 'logger'

# custom libs
require_relative '../lib/search/search_client'
require_relative '../lib/parse/parse_results'
require_relative '../lib/threaded_operations/threaded_get'

class ThreadTest < Minitest::Test
    # set up for all threaded tests
    full_name_query = "jane+smith"
    query           = SearchClient.new(full_name_query)
    query_result    = query.search()
    pr              = ParseResults.new(query_result.body)
    only_links       = pr.parse

  def threaded_get_requests
    ThreadedGet.new(link)
  end

end
