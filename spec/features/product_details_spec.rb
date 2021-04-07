require 'rails_helper'

RSpec.feature "Shows Product Details", type: :feature, js: true do

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

  scenario "They see product details page" do
    # ACT
    visit root_path
    first('.product').click_on 'Details'

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css ('.product-detail')
  end
end