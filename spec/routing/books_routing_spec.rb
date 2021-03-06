require 'rails_helper'

RSpec.describe BooksController,type: :routing do 

  describe "routing" do 

    it "routes to root" do 
      expect(:get => "/").to route_to("books#index")
    end

    it "routes to #index" do 
      expect(:get => "/books").to route_to("books#index")
    end

    it "routes to #show" do 
      expect(:get => "/books/1").to route_to("books#show", :id => "1")
    end

    it "routes to #new" do 
      expect(:get => "/books/new").to route_to("books#new")
    end

    it "routes to #create" do 
      expect(:post => "/books").to route_to("books#create")
    end

    it "routes to #edit" do 
      expect(:get => "/books/1/edit").to route_to("books#edit",:id => "1")
    end

    #using PATCH
    it "routes to #update" do 
      expect(:patch => "/books/1").to route_to("books#update",:id => "1")
    end

    #using PUT
    it "routes to #update" do 
      expect(:put => "/books/1").to route_to("books#update",:id => "1")
    end

    it "does not route to #delete" do 
      expect(:delete => "/books/1").not_to route_to("books#delete",:id=> "1")
    end
  end

end
