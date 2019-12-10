require 'rails_helper'

RSpec.describe "user deletes a book", type: :feature do


  scenario "successfully" do 
    @book = FactoryBot.create(:book)
    visit book_path @book 
    expect(current_path).to eq(book_path(@book))
    click_on "Destroy"
    expect(current_path).to eq(books_path)

  end

end
