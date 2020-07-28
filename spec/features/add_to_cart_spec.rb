require 'rails_helper'

RSpec.feature "Product Deatils", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path

    # VERIFY
    expect(page).to have_css 'article.product'
    #selecting product page
    first("article.product").find('button.btn-primary').trigger("click")

    expect(page.find('a', text: 'My Cart (1)')).to be_present
    
    save_screenshot
  end

end
