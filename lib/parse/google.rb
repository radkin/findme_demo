# google specific search engine parsing attributes and methods
class Google

  def initialize(links)
    @links = links
  end

  def gather_direct_links
    direct_links = []
    @links.each do |link|
      pruned_head_link = link.split(%r{^/url\?q=})[1]
      next unless !pruned_head_link.nil? && !pruned_head_link.match('google.com')

      direct_links.push(pruned_head_link.split(/&sa=U&ved=/)[0])
    end
    direct_links
  end

  def gather_search_queries
    return @links.map { |link| link.split(%r{^/search\?ie=UTF-8&q=})[1] }.compact
  end

end
