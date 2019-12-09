require 'rails_helper'

RSpec.describe "Books", type: :request do 

  describe "GET/index" do 
  before(:all) { get '/books' }

    it "returns a response with http status of success" do 
      expect(response).to have_http_status(:success)
    end

    it "returns a response with HTML content type" do 
      expect(response.content_type).to eq("text/html")
    end

  end




end
