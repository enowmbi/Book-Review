require 'rails_helper'

RSpec.describe "user visits categories index page", type: :feature do
 
  scenario "successfully" do 
     visit categories_path
     expect(current_path).to eq(categories_path)
     expect(page).to have_content("Categories")
  end



end
