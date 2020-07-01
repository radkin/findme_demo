# frozen_string_literal: true

# PARSING SEARCH RESULTS TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../lib/search/search_client'
require_relative '../lib/parse/google'
require_relative '../lib/parse/bing'
require_relative '../lib/parse/startpage'
require_relative '../lib/parser'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class SearchParseAllEngines < Minitest::Test
  # should return direct links and additional search query links
  def test_return_all_links_object
    full_name_query     = 'jane+smith'
    search_engines      = %w[startpage bing google]

    search_engines.each do |search_engine|
      # rest client initial query
      query               = SearchClient.new(full_name_query)
      query.search_engine = search_engine
      query_result        = query.search
      # nokogiri HTML processing
      parser              = Parser.new(query_result.body)
      links               = parser.gather_raw_links

      # common variables
      direct_links = []
      search_queries = []

      case search_engine
      when 'google'
        google         = Google.new(links)
        direct_links   = google.gather_direct_links
        search_queries = google.gather_search_queries
      when 'bing'
        bing           = Bing.new(links)
        direct_links   = bing.gather_direct_links
        search_queries = bing.gather_search_queries
      when 'startpage'
        startpage      = Startpage.new(links)
        direct_links   = startpage.gather_direct_links
        search_queries = []
      # SKIPPING other search engines. XPATH/CSS nokogiri can of worms
      else
        raise 'search engine undefined'
      end

      all_links = {
        'direct'          => direct_links,
        'search_queries'  => search_queries
      }

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
