require 'rails_helper'

RSpec.describe Category, type: :model do

  before(:each) { @category ||= FactoryBot.build(:category)}
  describe "validations" do 
      
    it "fails without a category name" do
       @category.name =""
       expect(@category).not_to be_valid
    end

    it "fails without a category description" do 
     @category.description =""
     expect(@category).not_to be_valid
  end

    xit "fails when category name already exists" do
        if Category.find_by(name: "#{@category.name}")
           expect(@category).not_to be_valid
        else
            expect(@category).to be_valid
        end
    end



  
  end

  describe "associations" do 

  end

  describe "graceful deletion" do 

  end

end
