require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @product = @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Page has My Cart" do
    visit root_path

    expect(page).to have_link('My Cart (0)')
  end

  scenario "Click on add to cart button and update cart quantity" do
    visit root_path
    
    click_button('Add', match: :first)

    expect(page).to have_link('My Cart (1)')
    save_screenshot
  end

end
