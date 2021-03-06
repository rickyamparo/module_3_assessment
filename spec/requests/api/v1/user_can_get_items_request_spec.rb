require 'rails_helper'

describe "Items API" do
  scenario "a user requests a list of all items in storedom" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success
    expect(response.status).to eq(200)

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
    expect(items.first["id"]).to eq(1)
    expect(items.first["name"]).to eq("test item")
    expect(items.first["description"]).to eq("this is an item")
    expect(items.first["image_url"]).to eq("ImageString")
    expect(items.first["created_at"]).to eq(nil)
    expect(items.first["updated_at"]).to eq(nil)
  end

  scenario "a user requests one item from storedom" do
    create_list(:item, 3)

    get '/api/v1/items/1'

    expect(response).to be_success
    expect(response.status).to eq(200)

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(1)
    expect(item["name"]).to eq("test item")
    expect(item["description"]).to eq("this is an item")
    expect(item["image_url"]).to eq("ImageString")
    expect(item["created_at"]).to eq(nil)
    expect(item["updated_at"]).to eq(nil)
  end

  scenario "a user requests to delete an item from storedom" do
    create_list(:item, 3)

    delete '/api/v1/items/1'

    expect(response).to be_success
    expect(response.status).to eq(204)
  end

  scenario "a user requests to create an item for storedom" do
    create_list(:item, 3)
    item_params = {name: "testing", description: "assessment", image_url: "test image"}

    post '/api/v1/items', params: {item: item_params}

    expect(response).to be_success
    expect(response.status).to eq(200)

    get '/api/v1/items/4'

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(4)
    expect(item["name"]).to eq("testing")
    expect(item["description"]).to eq("assessment")
    expect(item["image_url"]).to eq("test image")

    expect(item["created_at"]).to eq(nil)
    expect(item["updated_at"]).to eq(nil)
  end
end
