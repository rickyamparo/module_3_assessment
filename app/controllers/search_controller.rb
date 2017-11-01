class SearchController < ApplicationController

  def index
    @conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores?format=json&apiKey=ru99w3xp6qu5848qvbgrznxq") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response = @conn.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name,phone,distance&apiKey=ru99w3xp6qu5848qvbgrznxq")
    parsed_response = JSON.parse(response.body, symbolize_names: true)

    @stores = parsed_response[:stores].map do |store|
      Store.new(store)
    end
  end

end
