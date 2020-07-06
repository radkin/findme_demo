# frozen_string_literal: true

# CONDUCTING SEARCH TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../../lib/parse/google'
require_relative '../stubs/google_all_links'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class ParserTest < Minitest::Test
  def setup
    @stubbed_html             = File.read('./test/stubs/google_search.html')
    @google                   = Google.new(@stubbed_html)
    google_all_links          = GoogleAllLinks.new
    @stubbed_google_all_links = google_all_links.provider
  end

  def test_parser
    assert_equal @stubbed_google_all_links, @google.gather_all_links
  end

end
