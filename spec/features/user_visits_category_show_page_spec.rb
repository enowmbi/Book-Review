require 'rails_helper'

RSpec.describe "user visits category show page", type: :feature do 

  scenario "successfully" do 
    @category = FactoryBot.create(:category)
    visit categories_path
    expect(current_path).to eq(categories_path)
    expect(page).to have_link(@category.name)
    click_link(@category.name)
    expect(current_path).to eq(category_path(@category))
    expect(page).to have_content(@category.name)
  end

end
