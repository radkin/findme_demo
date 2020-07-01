# frozen_string_literal: true

# simple set up for our search client using rest
class SearchClient
  require 'rest-client'

  attr_accessor :search_engine

  def initialize(query)
    @query = query
  end

  def search
    @search_engine = 'google' unless defined? @search_engine
    url = "https://#{@search_engine}.com/search?q=#{@query}"
    response = RestClient.get(url)
    response
  end
end

# Please note that nokogiri can use the "open" method to GET the above link
