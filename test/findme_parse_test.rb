# frozen_string_literal: true

# PARSING SEARCH RESULTS TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../lib/search/search_client'
require_relative '../lib/parse/parse_results'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]

class ParseTest < Minitest::Test
  full_name_query = 'jane+smith'
  query           = SearchClient.new(full_name_query)
  query_result    = query.search
  pr              = ParseResults.new(query_result.body)
  # class scope for thie re-used hash
  @@all_links = pr.parse_google

  # should return a list of web links that nokogiri can parse
  def test_return_direct_links
    # no empty array
    assert @@all_links.length > 0
    # no empty values in our array
    assert @@all_links['direct'].map { |link| !link.nil? }
    # no google searches as we want only result links
    assert @@all_links['direct'].map { |link| !link.match('google.com') }
    # everything must start with https
    assert @@all_links['direct'].map { |link| link.match(%r{^https://}) }
  end

  def test_return_search_queries
    # no empty values in our array
    assert @@all_links['search_queries'].map { |link| !link.nil? }
  end
end
