class SearchController < ApplicationController

  def index
    raw_stores = BestBuyService.stores_by_zip(params[:zipcode])
    
    @stores = raw_stores[:stores].map do |store|
      Store.new(store)
    end
    # @stores = Store.find_by_zip(params[:zipcode])
  end

end
