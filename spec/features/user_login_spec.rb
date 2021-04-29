require 'rails_helper'

RSpec.feature "User can log in", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: "testing@testing.com",
      password: "testing",
      password_confirmation: "testing"
      )
    end


    scenario "Return to homepage with login credentials saved" do
      visit root_path
      page.click_link('Login')
  
      page.fill_in 'email', with: 'testing@testing.com'
      page.fill_in 'password', with: 'testing'
  
      page.click_on('Submit')
  
      expect(page).to have_content'Logout'
  end
end