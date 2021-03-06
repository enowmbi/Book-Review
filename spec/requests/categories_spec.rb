require 'rails_helper'

RSpec.describe CategoriesController, type: :request do 

  describe "GET/index" do 
    before(:all) do 
      @@category = FactoryBot.create(:category)
      get "/categories"
    end

    it "returns a response with http status of success" do 
      expect(response).to have_http_status(:success)      
    end

    it "returns a response with HTML content type " do 
      expect(response.content_type).to eq('text/html')
    end

  end

  describe "GET/show/1" do 
    before(:each) {get "/categories/#{Category.first.id}"}

    it "returns a response with http status of success" do 
      expect(response).to have_http_status(:success)
    end

    it "returns an html content type" do 
      expect(response.content_type).to eq('text/html')
    end
  end

  describe "GET/new" do 
    before(:each){get "/categories/new"}

    it "returns a response with http status of success" do
      expect(response).to have_http_status(:success)
    end

    it "returns a response with HTML content type" do 
      expect(response.content_type).to eq("text/html")
    end

  end

  describe "POST/create" do 
    let(:valid_params){{category:{name: "Time Travel",description: "All time travel issues"} }}
    before(:each){post categories_path,params: valid_params}

    it "returns a response with http status of redirected(302)" do 
      expect(response).to have_http_status(302)
    end

    it "returns a response with HTML content type" do 
      expect(response.content_type).to eq("text/html")
    end

  end

  describe "PATCH/update/1" do
    let(:valid_params){{category:{name: "Time Travel part 2"}}}
    before(:each){patch category_path(Category.last),params: valid_params}

    it "returns a response with http status of redirected(302)" do 
      expect(response).to have_http_status(302)
    end

    it 'returns a response with HTML content type' do 
      expect(response.content_type).to eq('text/html')
    end

  end

  describe "DELETE/destroy/1" do 
    before(:each){@category = FactoryBot.create(:category)}
    
    it "decrements category count by 1" do 
       expect{delete category_path(@category)}.to change(Category,:count).by(-1)
       expect(response).to have_http_status(302)
    end

  end

  after(:all){ @@category.destroy }

end
