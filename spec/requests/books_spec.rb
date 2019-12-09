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

  describe "GET/show/1" do 
    before(:all) {get "/books/#{Book.first.id}"}

    it "returns a response with http status of success" do 
      expect(response).to have_http_status(:success)
    end

    it "returns a response with HTML content type" do 
      expect(response.content_type).to eq("text/html")
    end
  end

  describe "GET/new" do 
    before(:all) {get '/books/new'}
    it "returns a response with http status of success" do 
      expect(response).to have_http_status(:success)
    end

    it "returns a response with HTML content type" do 
      expect(response.content_type).to eq("text/html")
    end
  end

  describe "POST /books" do 
    let(:valid_params) {{ book: {title: "Delivered? An Exegetical Investigation", description: "What is deliverance? what does it mean to be delivered? How are the words delivered and deliverance defined and used throughout the New Testament? Can a believer be indwelt with demons?",author: "Dr. Shawn Smith"} } }   
    before(:each) { post books_url,params: valid_params}

    it "returns a response with http status redirected" do 
      expect(response).to have_http_status(302)
    end

    it "returns a response with HTML content type" do 
      expect(response.content_type).to eq('text/html')
    end

    it "increments book collections by 1" do 
      expect{post books_url,params: valid_params}.to change(Book,:count).by(1)
    end
  end

  describe "PATCH/PUT /books/1" do 
    let(:valid_params) {{ book: {author: "Shawn Smith DD,ThD"} } }   
    before(:each) { patch book_url(Book.last),params: valid_params}

    it "returns a response with http status redirected" do 
      expect(response).to have_http_status(302)
    end

    it "returns a response with HTML content type" do 
      expect(response.content_type).to eq('text/html')
    end

  end

  describe "Delete/books/1" do 
    before(:all) do 
      @book = Book.last
    end

    it "reduces books collection by 1" do 
      expect{delete book_url(@book)}.to change(Book,:count).by(-1)
      expect(response).to have_http_status(302)
    end

  end



end



