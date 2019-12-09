require 'rails_helper'

RSpec.describe "user deletes a category", type: :feature do

  scenario "successfully" do 
    @category = FactoryBot.create(:category)
    visit category_path @category 
    expect(current_path).to eq(category_path(@category))
    click_on "Destroy"
    expect(current_path).to eq(categories_path)
  end

end
