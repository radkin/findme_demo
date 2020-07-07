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
    # initialize deduped stub
    stubbed_deduped_links               = DedupedMultiQueryLinks.new
    @stubbed_deduped                    = stubbed_deduped_links.provider
    # process raw links
    @common                             = Common.new
    raw_multi_query_links               = RawMultiQueryLinks.new
    @common.raw_multi_query_links       = raw_multi_query_links.provider
    @deduped                            = @common.dedupe
  end

  def test_deduper
    assert_equal @stubbed_deduped, @deduped
  end
end
