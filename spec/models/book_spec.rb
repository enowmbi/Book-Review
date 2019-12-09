require 'rails_helper'

RSpec.describe Book, type: :model do
 
  before(:all){ @book = FactoryBot.build(:book) }

  describe "validation" do 
    it "is invalid without a title" do
      @book.title = ""
      expect(@book).not_to be_valid
    end

    it "is invalid without a description" do 
      @book.description =""
      expect(@book).not_to be_valid
    end

    it "is invalid without an author" do 
      @book.author = ""
      expect(@book).not_to be_valid
    end

  end
  describe "associations" do 

  end



end
