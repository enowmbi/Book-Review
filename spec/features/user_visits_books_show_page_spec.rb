require 'rails_helper'

RSpec.describe "user visits book show page" , type: :feature do

  before(:all) { @book = FactoryBot.create(:book) }

  scenario "successfully" do 
    visit root_path
    # visit book_path(@book)
    click_link @book.title
    # expect(page).to redirect_to(book_path(@book))
    expect(page).to have_current_path(book_path(@book))
    expect(page).to have_content(@book.title)
  end

end