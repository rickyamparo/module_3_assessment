class SearchController <ApplicationController

  def index
    params
    @conn = Faraday.new()
  end

end
