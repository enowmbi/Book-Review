require 'rails_helper'

RSpec.describe "user visits new_review_page" do 
   scenario "successfully" do 
    book = FactoryBot.create(:book)
    visit book_path(book)
    expect(current_path).to eq(book_path(book))
    expect(page).to have_link("Add New Review")
    click_link("Add New Review")
    expect(current_path).to eq(new_book_review_path(book))
   end


end
