# frozen_string_literal: true

# CONDUCTING SEARCH TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../lib/search/search_client'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class SearchClientTest < Minitest::Test
  def setup
    @search_client = SearchClient.new
  end

  def test_search
    assert_equal mock_html, @search_client.search
  end

end
