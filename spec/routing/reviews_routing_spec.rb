require 'rails_helper'

RSpec.describe ReviewsController, type: :routing do

  describe "routing" do 
    it "doesn't route to reviews/index" do
       expect(:get => 'reviews').not_to route_to('reviews#index')
    end


    it "doesn't route to #new" do 
      expect(:get => 'reviews/new').not_to route_to('reviews#new')
    end

  end


end
