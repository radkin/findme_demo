# PARSING SEARCH RESULTS TESTS
require 'minitest/autorun'
require_relative '../lib/search/search_client'

class UserProvidedInformationTest < Minitest::Test

  # should return a list of web links that nokogiri can parse
  def test_return_web_links
    full_name_query = "jane+smith"
    query= SearchClient.new(full_name_query)
    query_result = query.search()
    puts (query_result.body)
  end

end
