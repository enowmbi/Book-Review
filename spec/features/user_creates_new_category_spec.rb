require 'rails_helper'

RSpec.describe "user creates new category", type: :feature do 

  scenario "successfully" do 
     visit categories_path
     click_link "Add New Category"
     expect(current_path).to eq(new_category_path)
     fill_in "category_name",with: "Politics"
     fill_in "category_description", with: "All political matters"
     click_on "Create Category"
     expect(current_path).to eq(category_path(Category.last))
  end



end
