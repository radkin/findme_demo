# startpage specific search engine parsing attributes and methods
class Startpage

  def initialize(links)
    @links = links
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

end
