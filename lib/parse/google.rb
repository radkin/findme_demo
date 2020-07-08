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
    patterns = [
      /\/preferences.google(.*)/,
      /\/policies.google(.*)/,
      /\/advanced_search(.*)/,
      /\/?output(.*)/,
      /\/\?sa=X&ved(.*)/
    ]
    @links          = @parser.gather_raw_links
    @links.each do |link|
      if link.match(/\/search?(.*)/)
        search_queries.push(link)
      elsif !patterns.any? { |pattern| pattern.match?(link) }
        direct_links.push(link)
      end
    end
    all_links           = {
      'direct'          => direct_links,
      'search_queries'  => search_queries
    }
    all_links
  end
end
