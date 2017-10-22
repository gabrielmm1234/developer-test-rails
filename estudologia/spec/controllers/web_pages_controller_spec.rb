require 'rails_helper'

RSpec.describe WebPagesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns web pages instance variable" do
      get :index
      expect(assigns(:web_pages)).not_to be_nil
    end

    it "returns all web pages" do
      FactoryGirl.create :web_page
      get :index
      expect(assigns(:web_pages).size).to eq(1)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      web_page = FactoryGirl.create :web_page
      get :show, params: {id: web_page.to_param}
      expect(response).to have_http_status(:success)
    end

    it "returns web page instance variable" do
      get :index
      expect(assigns(:web_pages)).not_to be_nil
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      web_page = FactoryGirl.create :web_page
      get :edit, params: {id: web_page.to_param}
      expect(response).to have_http_status(:success)
    end
  end
end
