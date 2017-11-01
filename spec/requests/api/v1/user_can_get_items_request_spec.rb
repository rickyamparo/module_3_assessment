require 'rails_helper'

describe "Items API" do
  scenario "a user requests a list of all items in storedom" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
    expect(items.first["id"]).to eq(1)
    expect(items.first["name"]).to eq("test item")
    expect(items.first["description"]).to eq("this is an item")
    expect(items.first["image_url"]).to eq("ImageString")
  end

  scenario "a user requests one item from storedom" do
    create_list(:item, 3)

    get '/api/v1/items/1'

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(1)
    expect(item["name"]).to eq("test item")
    expect(item["description"]).to eq("this is an item")
    expect(item["image_url"]).to eq("ImageString")
  end
end

# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
