class ParseResults

  require 'nokogiri'

  def initialize(query_result)
    @query_result = query_result
  end

  def parse
    direct_links = []
    html_doc  = Nokogiri::HTML(@query_result)
    nodeset   = html_doc.xpath('//a')
    links = nodeset.map {|element| element["href"]}.compact

    recommended_search_links = links.map {|all_links| all_links.split(/^\/search\?ie=UTF-8&q=/)[1]}
    raw_query_links = links.map {|all_links| all_links.split(/^\/url\?q=/)[1] }

    raw_query_links.each do |link|
      # TIGHTLY COUPLED TO GOOGLE . FIX THIS
      if !link.nil? && !link.match('google.com')
        # prune tail end metadata google uses
        pruned_link = link.split(/&sa=U&ved=/)[0]
        direct_links.push(pruned_link)
      end
    end
    # puts "recommended_search_links"
    # puts recommended_search_links
    return direct_links
  end

end
