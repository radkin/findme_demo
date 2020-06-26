# frozen_string_literal: true

class ParseResults
  require 'nokogiri'

  def initialize(query_result)
    @query_result = query_result
  end

  def parse_google
    all_links = {}
    direct_links = []
    search_queries = []
    html_doc = Nokogiri::HTML(@query_result)
    nodeset = html_doc.xpath('//a')
    links = nodeset.map { |element| element['href'] }.compact

    raw_search_queries = links.map { |all_links| all_links.split(%r{^/search\?ie=UTF-8&q=})[1] }
    raw_search_queries.each do |search_query|
      search_queries.push(search_query) unless search_query.nil?
    end

    raw_query_links = links.map { |all_links| all_links.split(%r{^/url\?q=})[1] }
    raw_query_links.each do |link|
      # TIGHTLY COUPLED TO GOOGLE . FIX THIS
      next unless !link.nil? && !link.match('google.com')

      # prune tail end metadata google uses
      pruned_link = link.split(/&sa=U&ved=/)[0]
      direct_links.push(pruned_link)
    end

    all_links = {
      'direct' => direct_links,
      'search_queries' => search_queries
    }
    return all_links
  end
  
  def parse_bing
  end
  
end
