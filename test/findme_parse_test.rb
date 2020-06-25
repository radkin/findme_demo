# PARSING SEARCH RESULTS TESTS
require 'minitest/autorun'
require_relative '../lib/search/search_client'
require_relative '../lib/parse/parse_results'

class UserProvidedInformationTest < Minitest::Test

  # should return a list of web links that nokogiri can parse
  def test_return_web_links
    full_name_query = "jane+smith"
    query           = SearchClient.new(full_name_query)
    query_result    = query.search()
    #puts (query_result.body)
    pr              = ParseResults.new(query_result.body)
    only_links       = pr.parse
    puts only_links
  end

end
