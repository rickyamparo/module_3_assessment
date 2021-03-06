require 'rails_helper'

describe Store do
  it "exists" do
    attributes = {
      name: "test store",
      distance: 2.0,
      phone: "1234567890",
      storeType: "test type"
    }

    store = Store.new(attributes)
    expect(store.name).to eq("test store")
    expect(store.distance).to eq(2.0)
    expect(store.phone_number).to eq("1234567890")
    expect(store.store_type).to eq("test type")
  end

  it "can find_by_zip" do
    @stores = Store.find_by_zip(80202)
    expect(@stores.count).to eq(17)
  end
end
