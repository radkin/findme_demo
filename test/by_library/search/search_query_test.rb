# frozen_string_literal: true

# CONDUCTING SEARCH TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../lib/search/search_query'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class SearchQueryTest < Minitest::Test
  def setup
    @search_query = SearchQuery.new
  end

  def test_query
    assert_equal "jane+doe", @search_query.construct
  end

end
