# frozen_string_literal: true

# PARSING SEARCH RESULTS TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../lib/search/search_client'
require_relative '../lib/parse/google'
require_relative '../lib/parse/bing'
require_relative '../lib/parse/startpage'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class SearchParseAllEngines < Minitest::Test
  # should return direct links and additional search query links
  def test_return_all_links_object
    full_name_query       = 'jane+smith'
    search_engines        = %w[startpage bing google]
    search_engines.each do |search_engine|
      # rest client initial query
      query               = SearchClient.new(full_name_query)
      query.search_engine = search_engine
      query_result        = query.search

      # common variables
      direct_links = []
      search_queries = []

      case search_engine
      when 'google'
        google         = Google.new(query_result)
        all_links      = google.gather_all_links
      when 'bing'
        bing           = Bing.new(query_result)
        all_links      = bing.gather_all_links
      when 'startpage'
        startpage      = Startpage.new(query_result)
        all_links      = startpage.gather_all_links
      # SKIPPING other search engines. XPATH/CSS nokogiri can of worms
      else
        raise 'search engine undefined'
      end

      # no empty array
      assert !all_links.empty?
      # no empty values in our array
      assert all_links['direct'].map { |link| !link.nil? }
      # no google searches as we want only result links
      assert all_links['direct'].map { |link| !link.match(search_engine) }
      # everything must start with https
      assert all_links['direct'].map { |link| link.match(%r{^https://}) }

    end # search engine loop
  end # test definition
end # test class
