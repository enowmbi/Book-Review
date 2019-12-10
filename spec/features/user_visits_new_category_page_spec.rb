require 'rails_helper'

RSpec.describe "user visits new category page", type: :feature do 

  scenario "successfully" do 
    visit categories_path
    click_on "Add New Category"
    expect(current_path).to eq(new_category_path)
    expect(page).to have_content("New Category")
  end


end
