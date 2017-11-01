class Store

  attr_accessor :name, :distance, :phone_number, :store_type, :attributes

  def initialize(attributes = {})
    @attributes = attributes
    @name = attributes[:name]
    @distance = attributes[:distance]
    @phone_number = attributes[:phone]
    @store_type = attributes[:storeType]
  end
end
