# frozen_string_literal: true

# CONDUCTING SEARCH TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../../lib/parse/startpage'
require_relative '../stubs/startpage_all_links'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ParserTest < Minitest::Test
  def setup
    @stubbed_html                 = File.read('./test/stubs/startpage_search.html')
    @startpage                    = Startpage.new(@stubbed_html)
    startpage_all_links           = StartpageAllLinks.new
    @stubbed_startpage_all_links  = startpage_all_links.provider
  end

  def test_parser
    assert_equal @stubbed_startpage_all_links, @startpage.gather_all_links
  end
end
