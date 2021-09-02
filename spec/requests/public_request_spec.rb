require 'rails_helper'

RSpec.describe "Publics", type: :request do

  describe "GET /main" do
    it "returns http success" do
      get 'http://localhost:3000'
      expect(response).to have_http_status(:success)
    end
  end
end
