# superclass of common search engine attributes
class Parser
  require 'nokogiri'

  def initialize(query_result)
    @query_result = query_result
  end

  def gather_raw_links
    direct_links    = []
    html_doc        = Nokogiri::HTML(@query_result)
    nodeset         = html_doc.xpath('//a')
    links           = nodeset.map { |element| element['href'] }.compact
    links
  end

end
