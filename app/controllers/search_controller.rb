class SearchController < ApplicationController

  def index
    @total = BestBuyService.new.stores_by_zip(params[:zipcode])[:total]
    @stores = Store.find_by_zip(params[:zipcode])
  end

end
