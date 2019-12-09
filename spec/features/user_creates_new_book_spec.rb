require 'rails_helper'

RSpec.describe "user creates new book", type: :feature do 

  scenario "successfully" do 
      visit root_path
      click_on "Add New Book"
      expect(current_path).to eq(new_book_path)
      fill_in "book_title", with: "Born to Win"
      fill_in "book_description", with: "A clear picture of the drama at Calvary"
      fill_in "book_author", with: "Dr. David Oyedepo"
      click_on "Create Book"
      expect(current_path).to eq(book_path(Book.last))
  end
end
