require 'rails_helper'
require_relative '../support/devise'

RSpec.describe ClientsController, type: :controller do
  ########## -> Login user
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
  ##########

  describe "GET #index" do
    
    context "from login user" do
    it "renders a successful response 200:OK" do
      request.host = 'admin.example.com'
      get :index, params: { use_route: '/users/sign_in'}
      expect(response).to have_http_status(:success)
    end

    it "should have on post" do
      create(:client)
      get :index, params: { use_route: '/users/sign_in'}
      expect(assigns(:clients)).to_not be_empty
    end
  end
end

  describe "GET #show" do

    let(:client) { create(:client) }

    it "should success and render to edit page" do
      get :show, params: { use_route: '/users/sign_in', id: client.id }
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
      expect(assigns(:client)).to be_a(Client)
      expect(assigns(:client)).to be_a_new(Client)
    end
 end

  describe "POST #create" do

    context "when it has valid parameters" do
      it "creates the client with correct attributes" do
        client_attributes = FactoryBot.attributes_for(:client)
        post :create, params: { client: client_attributes}
        expect(Client.last).to have_attributes(client_attributes)
    end
  end

    context "when it has no valid parameters" do
      it "does not create client" do
        expect{
          post :create, params: { client: {name: '', gender: '', kind: '', address: '', email: '', cpf: '', rg: '', phone: '', cnpj: '' }}
        }.to_not change(Client, :count)
    end
  end
end

  describe "PUT #update" do

     let!(:client) { create(:client) }

      it "should update name" do
        params = { name: "Update name" }
        put :update, params: { id: client.id, client: params }
        client.reload
        expect(client.name).to eq(params[:name])
        expect(response).to redirect_to(action: :show, id: assigns(:client).id)
  end

      it "should not update post info" do
        params = { name: nil }
        put :update, params: { id: client.id, client: params}  
        client.reload
        expect(response).to render_template(:edit)
  end
end

  describe "GET #edit" do

     let(:client) { create(:client) }
        
      it "should success and render to edit page" do
        get :edit, params: { id: client.id} 
        expect(response).to render_template(:edit)
        expect(assigns(:client)).to be_a(Client)
    end
  end

  describe "DELETE /destroy" do

    let!(:client) { create(:client) }

      it "destroys the requested client" do
        delete :destroy, params: { id: client.id }
        expect(response).to redirect_to(action: :index)
    end
  end
end
