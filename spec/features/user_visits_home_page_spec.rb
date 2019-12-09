require 'rails_helper'

RSpec.describe "Book", type: :feature do 

  scenario "user visits home page" do 
    visit root_path
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Book Review") 
  end

end
