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

  scenario "Visitor can login with created account" do
    steve = User.create!(name: 'steve', password: '1234')
    visit '/'
    fill_in 'Name', with: 'steve'
    fill_in 'Password', with: '1234'
    click_button "Enter"
    expect(current_path).to eq games_path
    expect(page).to have_content("Welcome, steve!")
  end

  scenario "Visitor cannot create account that already exists" do
    steve = User.create!(name: 'steve', password: '1234')
    visit '/'
    fill_in 'Name', with: 'steve'
    fill_in 'Password', with: '2345'
    click_button "Enter"
    expect(current_path).to eq '/'
    expect(page).to have_content("Incorrect password; user steve already exists")
  end

end
