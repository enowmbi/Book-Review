require 'rails_helper'

RSpec.describe "user adds new book", type: :feature do 
   
  scenario  "successfully" do 
     visit root_path
     click_on "Add New Book"
     expect(current_path).to eq(new_book_path)
     expect(page).to have_content("New Book")
  end


end
