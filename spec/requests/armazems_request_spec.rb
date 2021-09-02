require 'rails_helper'
require_relative '../support/devise'

RSpec.describe ArmazemsController, type: :controller do
  login_user

  describe "MyController" do
    
    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
  
    it "should get index" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #index" do
    
    context "from login user" do
    it "renders a successful response 200:OK" do
      request.host = 'admin.example.com'
      get :index, params: { use_route: '/users/sign_in'}
      expect(response).to have_http_status(:success)
    end

    it "should have on post" do
      create(:armazem)
      get :index, params: { use_route: '/users/sign_in'}
      expect(assigns(:armazems)).to_not be_empty
    end
  end
end

  describe "GET #show" do

    let(:armazem) { create(:armazem) }

    it "should success and render to edit page" do
      get :show, params: { use_route: '/users/sign_in', id: armazem.id }
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do

    it "should success and render to new page" do
      get :new, params: { use_route: '/users/sign_in'}
      expect(response).to have_http_status(200)
    end

    it "should new post" do
      get :new
      expect(assigns(:armazem)).to be_a(Armazem)
      expect(assigns(:armazem)).to be_a_new(Armazem)
    end
 end

  describe "POST #create" do

    context "when it has valid parameters" do
      it "creates the product with correct attributes" do
        armazem_attributes = FactoryBot.attributes_for(:armazem)
        post :create, params: { armazem: armazem_attributes}
        expect(Armazem.last).to have_attributes(armazem_attributes)
    end
  end

    context "when it has no valid parameters" do
      it "does not create product" do
        expect{
          post :create, params: { armazem: {name: '', brand: '', weight: '', price: '', description: '', avatar: ''}}
        }.to_not change(Armazem, :count)
    end
  end
end

  describe "PUT #update" do

     let!(:armazem) { create(:armazem) }

      it "should update food info" do
        params = { name: "Update title food" }
        put :update, params: { id: armazem.id, armazem: params }
        armazem.reload
        expect(armazem.name).to eq(params[:name])
        expect(response).to redirect_to(action: :show, id: assigns(:armazem).id)
  end

      it "should not update post info" do
        params = { name: nil }
        put :update, params: { id: armazem.id, armazem: params}  
        armazem.reload
        expect(response).to render_template(:edit)
  end
end

  describe "GET #edit" do

     let(:armazem) { create(:armazem) }
        
      it "should success and render to edit page" do
        get :edit, params: { id: armazem.id} 
        expect(response).to render_template(:edit)
        expect(assigns(:armazem)).to be_a(Armazem)
    end
  end

  describe "DELETE /destroy" do

    let!(:armazem) { create(:armazem) }

      it "destroys the requested food" do
        delete :destroy, params: { id: armazem.id }
        expect(response).to redirect_to(action: :index)
    end
  end
end
