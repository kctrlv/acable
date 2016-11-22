require 'rails_helper'

RSpec.feature "User Authentication" do
  scenario "Visitor can create account" do
    visit '/'
    fill_in 'Name', with: 'steve'
    fill_in 'Password', with: '1234'
    click_button "Enter"
    expect(current_path).to eq games_path
    expect(page).to have_content("Welcome, steve!")
  end
end
