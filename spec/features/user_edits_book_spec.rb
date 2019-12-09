require 'rails_helper'

RSpec.describe "user edits a book", type: :feature do 
  before(:all){ @book = FactoryBot.create(:book) }

   scenario "successfully" do 
    visit book_path @book
    expect(current_path).to eq(book_path(@book))
    click_on "Edit"
    expect(current_path).to eq(edit_book_path(@book))
   end

end
