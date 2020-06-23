class SearchClient

  require "rest-client"

  attr_accessor :search_engine

  def initialize(query)
    @query = query
  end

  def search
    if !defined? @search_engine
      @search_engine = "google"
    end
    url = "https://#{@search_engine}.com/search?q=#{@query}"
    response = RestClient.get(url)
    return response
  end

end
