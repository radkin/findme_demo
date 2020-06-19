class SearchClient

  def initialize()
    search_engine = "google"
  end

  def search(query, search_engine)
    uri = URI("https://#{search_engine}.com")
    response = Net::HTTP.get_response(uri)
    return response
  end

end
