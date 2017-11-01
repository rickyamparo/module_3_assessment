class SearchController < ApplicationController

  def index
    @stores = Store.find_by_zip(params[:zipcode])

  end

end
