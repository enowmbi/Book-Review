require 'rails_helper'

RSpec.describe Review, type: :model do

  describe "validation" do 
    review = FactoryBot.build(:review)
    it "fails without rating" do 
      review.rating =''
      expect(review).not_to be_valid
    end

    it "fails without numeric rating " do 
      review.rating ='abcd'
      expect(review).not_to be_valid
    end

    it "fails with a rating of out of range(1..5)" do
      review.rating = 15
      expect(review).not_to be_valid
    end

    it "fails without comment" do 
      review.comment = ''
      expect(review).not_to be_valid
    end

    it "fails without a user id" do 
      review.user_id = nil
      expect(review).not_to be_valid
    end

    it "fails without a book id" do 
      review.book_id = nil
      expect(review).not_to be_valid
    end
  end

end
