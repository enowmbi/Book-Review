require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validation" do 
    it "fails without admin? column" do 
      user = FactoryBot.build(:user,admin?: nil)
      expect(user).not_to be_valid
    end
    end
  end
