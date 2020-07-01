# bing specific search engine parsing attributes and methods
class Bing

  def initialize(links)
    @links = links
  end

  def gather_direct_links
    direct_links = []
    @links.each do |link|
      direct_links.push(link) if link.match('https') && !link.match('go.microsoft.com')
    end
    direct_links
  end

  def gather_search_queries
    return @links.map { |link| link.split(%r{/search\?q=})[1] }.compact
  end

end
