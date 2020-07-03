# frozen_string_literal: true

# CONDUCTING SEARCH TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../lib/parser'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ParserTest < Minitest::Test

  @stubbed_links = [

  ]

  stubbed_query_result = [

  ]

  def setup
    @parser = Parser.new
  end

  def test_parser
    assert_equal stubbed_links, @parser.gather_raw_links(stubbed_query_result)
  end

end
