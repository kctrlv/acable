require 'rails_helper'

RSpec.feature "Games Listing" do
  scenario 'Logged out users are redirected back to home page' do
    visit '/games'
    expect_path(root_path)
  end

  scenario 'User goes to games index and sees themselves in online user list' do # dont redirect anywhere
    enter_as_steve
    within('.online-users') do
      expect_content('steve')
    end
  end
end
