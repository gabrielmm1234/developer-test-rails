require 'rails_helper'

RSpec.describe WebPagesController, type: :controller do
  let(:valid_attributes) { {
    title: "Estudologia",
    description: "Factory para página web",
    body: "Corpo de página web",
    author: "Mesquita"
  } }

  let(:invalid_attributes) { { title: nil } }

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

  describe "POST #create" do
    it "creates a web page with valid attributes" do
      expect {
        post :create, params: {web_page: valid_attributes}
      }.to change(WebPage, :count).by(1)
    end

    it "redirects to show page after creates the web page" do
      post :create, params: {web_page: valid_attributes}
      expect(response).to redirect_to(WebPage.last)
    end

    it "does not create a web page with invalid attributes" do
      expect {
        post :create, params: {web_page: invalid_attributes}
      }.to change(WebPage, :count).by(0)
    end

    it "renders new page after not creating the web page" do
      post :create, params: {web_page: invalid_attributes}
      expect(response).to render_template(:new)
    end
  end

  describe "PUT #update" do
    let(:new_attributes) { {
      title: "Estudo",
      description: "Factory para página web",
      body: "Corpo de página web",
      author: "Mesquita"
    } }

    it "updates a web page with valid attributes" do
      web_page = WebPage.create! valid_attributes
      put :update, params: {id: web_page.to_param, web_page: new_attributes}
      web_page.reload
      expect(web_page.title).to eq('Estudo')
    end

    it "redirects to show page after updating the web page" do
      web_page = WebPage.create! valid_attributes
      put :update, params: {id: web_page.to_param, web_page: new_attributes}
      expect(response).to redirect_to(WebPage.last)
    end

    it "does not update a web page with invalid attributes" do
      web_page = WebPage.create! valid_attributes
      put :update, params: {id: web_page.to_param, web_page: invalid_attributes}
      web_page.reload
      expect(web_page.title).to eq('Estudologia')
    end

    it "renders edit page after not updating the web page" do
      web_page = WebPage.create! valid_attributes
      put :update, params: {id: web_page.to_param, web_page: invalid_attributes}
      web_page.reload
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the web page" do
      web_page = WebPage.create! valid_attributes
      expect {
        delete :destroy, params: {id: web_page.to_param}
      }.to change(WebPage, :count).by(-1)
    end

    it "redirects to the index page" do
      web_page = WebPage.create! valid_attributes
      delete :destroy, params: {id: web_page.to_param}
      expect(response).to redirect_to('/web_pages')
    end
  end
end
