# frozen_string_literal: true

# PARSING SEARCH RESULTS TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../lib/search/search_client'
require_relative '../lib/parse/parse_results'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ParseTest < Minitest::Test
  # should return a list of web links that nokogiri can parse
  def test_return_direct_links
    full_name_query = 'jane+smith'
    search_engines  = %w[startpage bing google]

    search_engines.each do |search_engine|
      query               = SearchClient.new(full_name_query)
      query.search_engine = search_engine
      query_result        = query.search
      pr                  = ParseResults.new(query_result.body)
      all_links           = []
      
      case search_engine
      when 'google'
        all_links = pr.parse_google
      when 'bing'
        all_links = pr.parse_bing
      when 'startpage'
        all_links = pr.parse_startpage
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
    end
  end
end
