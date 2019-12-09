require 'rails_helper'

RSpec.describe "user visits home page", type: :feature do 

  scenario "successfully" do 
    visit root_path
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Book Review") 
    expect(page).to have_link('Making Marriage Work')
  end

end
