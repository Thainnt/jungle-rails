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

  scenario "Page have link to product" do
    visit root_path

    expect(page).to have_link("Details")
  end

  scenario "Click on a product link and open the new page" do
    visit root_path
    
    click_link('Details', match: :first)

    expect(page).to have_css 'section.products-show'
    save_screenshot
  end

end