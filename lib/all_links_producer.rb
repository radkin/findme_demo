require_relative '../lib/parse/google'
require_relative '../lib/parse/bing'
require_relative '../lib/parse/startpage'

# abstract away how we are producing all_links
class AllLinksProducer

  def initialize(query_result, search_engine)
    @query_result   = query_result
    @search_engine  = search_engine
  end

  def supply
    all_links = {}
    case @search_engine
    when 'google'
      google         = Google.new(@query_result)
      all_links      = google.gather_all_links
    when 'bing'
      bing           = Bing.new(@query_result)
      all_links      = bing.gather_all_links
    when 'startpage'
      startpage      = Startpage.new(@query_result)
      all_links      = startpage.gather_all_links
    # SKIPPING other search engines. XPATH/CSS nokogiri can of worms
    else
      raise 'search engine undefined'
    end
    all_links
  end

end
