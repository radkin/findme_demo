# frozen_string_literal: true

require_relative '../parser'

# google specific search engine parsing attributes and methods
class Google
  def initialize(query_result)
    @parser         = Parser.new(query_result)
    @query_result   = query_result
  end

  def gather_direct_links
    direct_links = []
    @links.each do |link|
      pruned_head_link = link.split(%r{^/url\?q=})[1]
      next unless !pruned_head_link.nil? && !pruned_head_link.match('google.com')

      direct_links.push(pruned_head_link.split(/&sa=U&ved=/)[0])
    end
    direct_links
  end

  def gather_search_queries
    @links.map { |link| link.split(%r{^/search\?ie=UTF-8&q=})[1] }.compact
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
