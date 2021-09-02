require 'rails_helper'
require_relative '../support/devise'

RSpec.describe "Accounts", type: :request do
 
  describe "GET #index" do
    
    context "from sign up" do
    it "renders a successful response 200:OK" do
      get "/users/sign_up"
      expect(response).to have_http_status(:success)
    end
  end
end

  describe "POST #create" do

    context "when it has valid parameters" do
      it "creates the account with correct attributes" do
        account_attributes = FactoryBot.attributes_for(:account)
        
        expect(Account.last).to have_attributes(account_attributes)
    end
  end

    context "when it has no valid parameters" do
      it "does not create account" do
        expect{ { account: {first_name: '', last_name: '', email: '', password: '', password_confirmation: '' }}
        }.to_not change(Account, :count)
    end
  end
end
end
