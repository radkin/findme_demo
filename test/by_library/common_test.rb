# frozen_string_literal: true

# CONDUCTING SEARCH TESTS
require 'minitest/autorun'
require 'minitest/reporters'

# custom libs
require_relative '../../lib/common'
require_relative '../stubs/deduped_multi_query_links'
require_relative '../stubs/raw_multi_query_links'

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

class CommonTest < Minitest::Test
  def setup
    @common                             = Common.new
    @stubbed_deduped_multi_query_links  = DedupedMultiQueryLinks.new
    @stubbed_raw_multi_query_links      = RawMultiQueryLinks.new
  end

  def test_deduper
    assert_equal @stubbed_deduped_multi_query_links,
      @common.dedupe(@stubbed_raw_multi_query_links)
  end
end
