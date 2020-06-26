# frozen_string_literal: true

# CONDUCTING SEARCH TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../lib/user_provided_information'
require_relative '../lib/search/search_query'
require_relative '../lib/search/search_client'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]

class SearchTest < Minitest::Test
  def test_import_userpi_template
    @testJSON = {
      'firstName' => 'jane',
      'lastName' => 'smith',
      'emailAddress' => 'jsmith@anon.com',
      'street' => 'anon', 'apartment' => '1',
      'city' => 'anonville',
      'state' => 'North Anon',
      'zipCode' => '99999',
      'phoneNumber' => '5555555555'
    }
    @user_pi = UserProvidedInformation.new.import_PI
    assert_equal @user_pi, @testJSON
  end

  def test_create_search_query
    @user_pi        = UserProvidedInformation.new.import_PI
    type            = 'full_name_query'
    search_query    = SearchQuery.new(@user_pi, type)
    full_name_query = search_query.construct

    assert_equal 'jane+smith', full_name_query
  end

  # Google search engine
  def test_run_search_query
    full_name_query = 'jane+smith'
    # testing use of default search engine as optional second variable
    query = SearchClient.new(full_name_query)
    query_result = query.search
    # status code should be 200
    assert_equal 200, query_result.code
  end

  # other search engines
  def test_run_non_default_search_engine
    search_engines = %w[bing yandex yahoo startpage duckduckgo
                        baidu searchencrypt gigablast]
    full_name_query = 'jane+smith'
    search_engines.each do |engine|
      t1 = Time.now
      query = SearchClient.new(full_name_query)
      query.search_engine = engine
      print "running #{engine} search"
      query_result = query.search
      t2 = Time.now
      delta = t2 - t1
      puts " .. took #{delta} seconds"
      # status code should be 200
      assert_equal 200, query_result.code
    end
  end
end
