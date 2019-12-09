require 'rails_helper'

RSpec.describe "user updates a category", type: :feature do

  scenario "successfully" do 
    @category = FactoryBot.create(:category)
    visit category_path @category 
    expect(current_path).to eq(category_path(@category))
    click_on "Edit"
    expect(current_path).to eq(edit_category_path(@category))
    fill_in "category_name",with: "Christian Material"
    click_on "Update Category"
    expect(current_path).to eq(category_path(@category))

  end





end
