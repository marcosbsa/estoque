 require 'rails_helper'
 require_relative '../support/devise'

RSpec.describe FoodsController, type: :controller do
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
      create(:food)
      get :index, params: { use_route: '/users/sign_in'}
      expect(assigns(:foods)).to_not be_empty
    end
  end
end

  describe "GET #show" do

    let(:food) { create(:food) }

    it "should success and render to edit page" do
      get :show, params: { use_route: '/users/sign_in', id: food.id }
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
      expect(assigns(:food)).to be_a(Food)
      expect(assigns(:food)).to be_a_new(Food)
    end
 end

  describe "POST #create" do

    context "when it has valid parameters" do
      it "creates the product with correct attributes" do
        food_attributes = FactoryBot.attributes_for(:food)
        post :create, params: { food: food_attributes}
        expect(Food.last).to have_attributes(food_attributes)
    end
  end

    context "when it has no valid parameters" do
      it "does not create product" do
        expect{
          post :create, params: { food: {titulo: '', marca: '', preco: '', peso: ''}}
        }.to_not change(Food, :count)
    end
  end
end

  describe "PUT #update" do

     let!(:food) { create(:food) }

      it "should update food info" do
        params = { titulo: "Update title food" }
        put :update, params: { id: food.id, food: params }
        food.reload
        expect(food.titulo).to eq(params[:titulo])
        expect(response).to redirect_to(action: :show, id: assigns(:food).id)
  end

      it "should not update post info" do
        params = { titulo: nil }
        put :update, params: { id: food.id, food: params}  
        food.reload
        expect(response).to render_template(:edit)
  end
end

  describe "GET #edit" do

     let(:food) { create(:food) }
        
      it "should success and render to edit page" do
        get :edit, params: { id: food.id} 
        expect(response).to render_template(:edit)
        expect(assigns(:food)).to be_a(Food)
    end
  end

  describe "DELETE /destroy" do

    let!(:food) { create(:food) }

      it "destroys the requested food" do
        delete :destroy, params: { id: food.id }
        expect(response).to redirect_to(action: :index)
    end
  end
end
