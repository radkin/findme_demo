class ParseResults

  require 'nokogiri'

  def initialize(query_result)
    @query_result = query_result
  end

  def parse
    all_links = Hash.new()
    direct_links = []
    search_queries = []
    html_doc  = Nokogiri::HTML(@query_result)
    nodeset   = html_doc.xpath('//a')
    links = nodeset.map {|element| element["href"]}.compact

    raw_search_queries = links.map {|all_links| all_links.split(/^\/search\?ie=UTF-8&q=/)[1]}
    raw_search_queries.each do |search_query|
      if !search_query.nil?
        search_queries.push(search_query)
      end
    end

    raw_query_links = links.map {|all_links| all_links.split(/^\/url\?q=/)[1] }
    raw_query_links.each do |link|
      # TIGHTLY COUPLED TO GOOGLE . FIX THIS
      if !link.nil? && !link.match('google.com')
        # prune tail end metadata google uses
        pruned_link = link.split(/&sa=U&ved=/)[0]
        direct_links.push(pruned_link)
      end
    end

    all_links = {
      "direct"          => direct_links,
      "search_queries"  => search_queries
    }
    return all_links
  end

end
