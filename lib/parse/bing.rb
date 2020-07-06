# frozen_string_literal: true

require_relative '../parser'

# bing specific search engine parsing attributes and methods
class Bing
  def initialize(query_result)
    @parser         = Parser.new(query_result)
    @query_result   = query_result
  end

  def gather_direct_links
    direct_links = []
    @links.each do |link|
      direct_links.push(link) if link.match('https') && !link.match('go.microsoft.com')
    end
    direct_links
  end

  def gather_search_queries
    @links.map { |link| link.split(%r{/search\?q=})[1] }.compact
  end

  def gather_all_links
    @links          = @parser.gather_raw_links
    direct_links    = gather_direct_links
    search_queries  = gather_search_queries
    all_links       = {
      'direct' => direct_links,
      'search_queries' => search_queries
    }
    all_links
  end
end
