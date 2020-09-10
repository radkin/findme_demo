# frozen_string_literal: true

# CONDUCTING SEARCH TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../../lib/parse/bing'
require_relative '../stubs/bing_all_links'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ParserTest < Minitest::Test
  def setup
    @stubbed_html           = File.read('./test/stubs/bing_search.html')
    @bing                   = Bing.new(@stubbed_html)
    bing_all_links          = BingAllLinks.new
    @stubbed_bing_all_links = bing_all_links.provider
  end

  def test_parser
    assert_equal @stubbed_bing_all_links, @bing.gather_all_links
  end
end
