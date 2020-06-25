# PARSING SEARCH RESULTS TESTS
require 'minitest/autorun'
require_relative '../lib/search/search_client'
require_relative '../lib/parse/parse_results'

class UserProvidedInformationTest < Minitest::Test

  # should return a list of web links that nokogiri can parse
  def test_return_web_links_not_nil
    full_name_query = "jane+smith"
    query           = SearchClient.new(full_name_query)
    query_result    = query.search()
    pr              = ParseResults.new(query_result.body)
    only_links       = pr.parse
    # no empty values in our array
    assert only_links.map{|link| !link.nil?}
    # no google searches as we want only result links
    assert only_links.map{|link| !link.match('google.com')}
    # everything must start with https
    assert only_links.map{|link| link.match(/^https:\/\//)}
  end

end
