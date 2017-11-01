require 'will_paginate/array'

class SearchController < ApplicationController

  def index
    @total = BestBuyService.new.stores_by_zip(params[:zipcode])[:total]
    stores = Store.find_by_zip(params[:zipcode])
    @stores = stores.paginate(:page => 1, :per_page => 10)
  end

end
