require 'rails_helper'

RSpec.feature "Add To Cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Cart number updates to 1" do
    # ACT
    visit root_path

    # DEBUG
    # save_screenshot
    first('.product').click_on('Add')
    # VERIFY
    expect(page).to have_text 'My Cart (1)'
  end
end