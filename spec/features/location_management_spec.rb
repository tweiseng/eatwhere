require "rails_helper"

RSpec.feature "Location management", :type => :feature do
  scenario "User inputs a new town/city" do
    visit "/locations/new"

    fill_in "Name", :with => "Town/city"
    click_button "Save"

    expect(page).to have_text("location saved!")
  end
end