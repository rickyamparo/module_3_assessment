require 'rails_helper'

describe BestBuyService do
  context ".stores_by_zip(zip)" do
    it "returns an array of hashes with store data" do
      raw_stores = BestBuyService.stores_by_zip(80202)[:stores]
      raw_store = raw_stores.first
      expect(raw_stores.count).to eq(17)
    end
  end
end
