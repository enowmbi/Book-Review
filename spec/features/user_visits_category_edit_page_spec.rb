require 'rails_helper'

RSpec.describe "user visits category edit page", type: :feature do 

    before(:each){@category = FactoryBot.create(:category)} 
  scenario "successfully" do
    visit categories_path
    expect(current_path).to eq(categories_path)
    click_link(@category.name)
    expect(current_path).to eq(category_path(@category))
    click_link("Edit")
    expect(current_path).to eq(edit_category_path(@category))
    expect(page).to have_content("Editing Category")
  end

end
