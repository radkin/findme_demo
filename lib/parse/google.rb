# frozen_string_literal: true

require_relative '../parser'

# google specific search engine parsing attributes and methods
class Google
  def initialize(query_result)
    @parser         = Parser.new(query_result)
    @query_result   = query_result
  end

  def gather_all_links
    direct_links    = []
    search_queries  = []
    patterns        = [
      %r{/preferences.google(.*)},
      %r{/policies.google(.*)},
      %r{/advanced_search(.*)},
      %r{/?output(.*)},
      %r{/\?sa=X&ved(.*)}
    ]
    @links = @parser.gather_raw_links
    @links.each do |link|
      if link.match?(%r{/search?(.*)})
        search_queries.push(link)
      elsif patterns.none? { |pattern| pattern.match?(link) }
        direct_links.push(link)
      end
    end
    all_links = {
      'direct' => direct_links,
      'search_queries' => search_queries
    }
    all_links
  end
end
