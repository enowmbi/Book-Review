require 'rails_helper'

RSpec.describe "Book", type: :feature do 

  scenario "visit home page" do 
    visit root_path
    expect(page).to have_content("Book Review") 
  end

end
