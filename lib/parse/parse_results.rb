# frozen_string_literal: true

class ParseResults
  require 'nokogiri'

  def initialize(query_result)
    @query_result = query_result
  end

  def parse_google
    all_links       = {}
    direct_links    = []
    search_queries  = []
    html_doc        = Nokogiri::HTML(@query_result)
    nodeset         = html_doc.xpath('//a')
    links           = nodeset.map { |element| element['href'] }.compact
    # search links
    search_queries  = links.map { |link| link.split(%r{^/search\?ie=UTF-8&q=})[1] }.compact
    # direct links
    links.each do |link|
      pruned_head_link = link.split(%r{^/url\?q=})[1]
      next unless !pruned_head_link.nil? && !pruned_head_link.match('google.com')
      direct_links.push(pruned_head_link.split(/&sa=U&ved=/)[0])
    end
    all_links = {
      'direct' => direct_links,
      'search_queries' => search_queries
    }
    all_links
  end

  def parse_bing
    all_links       = {}
    direct_links    = []
    search_queries  = []
    html_doc        = Nokogiri::HTML(@query_result)
    nodeset         = html_doc.xpath('//a')
    links           = nodeset.map { |element| element['href'] }.compact
    # search links
    search_queries  = links.map { |link| link.split(/\/search\?q=/)[1] }.compact
    # direct links
    links.each do |link|
      if link.match('https') && !link.match('go.microsoft.com')
        direct_links.push(link)
      end
    end
    all_links = {
      'direct' => direct_links,
      'search_queries' => search_queries
    }
    all_links
  end

  def parse_startpage
    all_links       = {}
    direct_links    = []
    html_doc        = Nokogiri::HTML(@query_result)
    nodeset         = html_doc.xpath('//a')
    links           = nodeset.map { |element| element['href'] }.compact

    # startpage has no search links
    search_queries = []

    # filter these from list of direct links
    startpage_filters = ['www.startpage.com', 'support.startpage.com',
      'www.startmail.com']
    sf = Regexp.union(startpage_filters)

    # direct links
    links.each do |link|
      if link.match('https') && !link.match(sf)
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
