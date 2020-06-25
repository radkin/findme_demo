class ParseResults

  require 'nokogiri'

  def initialize(query_result)
    @query_result = query_result
  end

  def parse
    only_links = []
    html_doc  = Nokogiri::HTML(@query_result)
    nodeset   = html_doc.xpath('//a')
    links = nodeset.map {|element| element["href"]}.compact
    # it looks like a lot of links are new google search queries
    # How do we handle those? For now, skipping them
    raw_query_links = links.map {|all_links| all_links.split(/^\/url\?q=/)[1] }
    raw_query_links.each do |link|
      # remove search links that are searches
      if !link.nil? && !link.match('google.com')
        # prune tail end metadata google uses
        pruned_link = link.split(/&sa=U&ved=/)[0]
        only_links.push(pruned_link)
      end
    end
    return only_links
  end

end
