class BestBuyService

  def initialize
    @conn = Faraday.new(:url => "https://api.bestbuy.com/v1/stores?format=json&apiKey=ru99w3xp6qu5848qvbgrznxq") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def stores_by_zip(zipcode)
    response = @conn.get("https://api.bestbuy.com/v1/stores(area(#{zipcode},25))?format=json&show=storeId,storeType,name,phone,distance&apiKey=ru99w3xp6qu5848qvbgrznxq")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end

  def self.stores_by_zip(zipcode)
    new.stores_by_zip(zipcode)
  end

end
