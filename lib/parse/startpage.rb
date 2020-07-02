# frozen_string_literal: true

# startpage specific search engine parsing attributes and methods
class Startpage
  def initialize(query_result)
    @parser         = Parser.new(query_result)
    @query_result   = query_result
  end

  def gather_direct_links
    direct_links = []
    # filter these from list of direct links
    startpage_filters = ['www.startpage.com', 'support.startpage.com',
                         'www.startmail.com']
    sf = Regexp.union(startpage_filters)
    # direct links
    @links.each do |link|
      direct_links.push(link) if link.match('https') && !link.match(sf)
    end
    direct_links
  end

  def gather_all_links
    @links          = @parser.gather_raw_links
    direct_links    = gather_direct_links
    search_queries  = []
    all_links       = {
      'direct' => direct_links,
      'search_queries' => search_queries
    }
    all_links
  end
end
