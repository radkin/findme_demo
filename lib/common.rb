# frozen_string_literal: true

class Common
  attr_accessor :raw_multi_query_links

  # accepts a hash of hashes and removes duplcate values
  def dedupe
    deduped_direct      = []
    deduped_query_links = []

    @raw_multi_query_links.each do |_key, value|
      deduped_direct.push(value['direct']).compact
      deduped_query_links.push(value['query_links']).compact
    end
    deduped = {
      'direct' => deduped_direct,
      'query_links' => deduped_query_links
    }
    deduped
  end
end
