require 'rails_helper'

RSpec.feature "Games Listing" do
  scenario 'Logged out users are redirected back to home page' do
    visit '/games'
    expect_path(root_path)
  end
end
