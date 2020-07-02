# frozen_string_literal: true

# PARSING SEARCH RESULTS TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../lib/search/search_client'
require_relative '../lib/all_links_producer'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class SearchParseAllEngines < Minitest::Test
  # should return direct links and additional search query links
  def test_return_all_links_object
    full_name_query       = 'jane+smith'
    search_engines        = %w[startpage bing google]
    search_engines.each do |search_engine|
      # reset the value each time we run a new search engine
      all_links           = {}
      # rest client initial query
      query               = SearchClient.new(full_name_query)
      query.search_engine = search_engine
      query_result        = query.search
      # parse according to each search engine's specific requirements
      producer = AllLinksProducer.new(query_result, search_engine)
      all_links = producer.supply

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
