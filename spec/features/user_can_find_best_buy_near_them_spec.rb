require 'rails_helper'

describe "Best Buy Location Search" do
  scenario "a user can search with their zip code and see 10 stores near them within a 25 mile radius" do
    user = create(:user)

    visit '/'

    fill_in "zipcode", with: "80202"
    click_on "Search"

    expect(current_path).to eq('/search')
    expect(current_url).to have_content('zipcode=80202')

    expect(page).to have_content("Stores within 25 miles of 80202")
    expect(page).to have_content("17 Stores")
    expect(page).to have_css('.store', count: 10)
    within first('.store') do
      expect(page).to have_css('.name')
      expect(page).to have_css('.distance')
      expect(page).to have_css('.phone-number')
      expect(page).to have_css('.store-type')
    end
    expect(page).to have_link "Next"
  end
end
