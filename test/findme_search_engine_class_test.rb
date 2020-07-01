# frozen_string_literal: true

# PARSING SEARCH RESULTS TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../lib/search/search_client'
require_relative '../lib/parse/google'
require_relative '../lib/parser'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ParseTest < Minitest::Test

  def test_return_all_links_object
    full_name_query     = 'jane+smith'
    search_engine       = "google"

    query               = SearchClient.new(full_name_query)
    query.search_engine = search_engine
    query_result        = query.search

    parser              = Parser.new(query_result.body)
    links               = parser.gather_raw_links

    google              = Google.new(links)
    direct_links        = google.gather_direct_links
    search_queries      = google.gather_search_queries

    all_links = {
      'direct'          => direct_links,
      'search_queries'  => search_queries
    }

    puts all_links

=begin
      # no empty array
      assert !all_links.empty?
      # no empty values in our array
      assert all_links['direct'].map { |link| !link.nil? }
      # no google searches as we want only result links
      assert all_links['direct'].map { |link| !link.match(search_engine) }
      # everything must start with https
      assert all_links['direct'].map { |link| link.match(%r{^https://}) }
=end

  end

end
