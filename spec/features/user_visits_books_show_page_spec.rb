require 'rails_helper'

RSpec.describe "user visits book show page" , type: :feature do

  scenario "successfully" do 
    @book= FactoryBot.create(:book)
    visit root_path
    expect(page).to have_link("#{@book.title}")
    click_link @book.title
    expect(page).to have_current_path(book_path(@book))
    expect(page).to have_content(@book.title)
  end

end
