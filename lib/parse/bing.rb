# frozen_string_literal: true

require_relative '../parser'

# bing specific search engine parsing attributes and methods
class Bing
  def initialize(query_result)
    @parser         = Parser.new(query_result)
    @query_result   = query_result
  end

  def gather_all_links
    direct_links    = []
    search_queries  = []
    @links          = @parser.gather_raw_links
    @links.each do |link|
      if link.match('https') && !link.match('go.microsoft.com')
        direct_links.push(link)
      else
        next unless link.match(/\/search(.*)/)
        search_queries.push(link)
      end
    end
    all_links           = {
      'direct'          => direct_links,
      'search_queries'  => search_queries
    }
    all_links
  end
end
