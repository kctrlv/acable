require 'rails_helper'

RSpec.feature "User Authentication" do
  scenario "Visitor can create account" do
    enter_as_steve
    expect_path(games_path)
    expect_content("Welcome, steve!")
  end

  scenario "Visitor can login with created account" do
    steve = User.create!(name: 'steve', password: '1234')
    enter_as_steve
    expect_path(games_path)
    expect_content("Welcome, steve!")
  end

  scenario "Visitor cannot create account that already exists" do
    steve = User.create!(name: 'steve', password: '1234')
    enter_as_steve('2345')
    expect_path(root_path)
    expect_content("Incorrect password; user steve already exists")
  end

  scenario "Visitor can logout" do
    enter_as_steve
    expect_path(games_path)
    click_link "Logout"
    expect_path(root_path)
  end
end
