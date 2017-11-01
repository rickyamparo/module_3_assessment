class Store

  attr_accessor :name, :distance, :phone_number, :store_type, :attributes

  def initialize(attributes = {})
    @attributes = attributes
    @name = attributes[:name]
    @distance = attributes[:distance]
    @phone_number = attributes[:phone]
    @store_type = attributes[:storeType]
  end

  def self.find_by_zip(zipcode)
    raw_stores = BestBuyService.stores_by_zip(zipcode)
    @stores = raw_stores[:stores].map do |store|
      Store.new(store)
    end
  end
end
