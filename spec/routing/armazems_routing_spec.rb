require "rails_helper"

RSpec.describe ArmazemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/armazems").to route_to("armazems#index")
    end

    it "routes to #new" do
      expect(get: "/armazems/new").to route_to("armazems#new")
    end

    it "routes to #show" do
      expect(get: "/armazems/1").to route_to("armazems#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/armazems/1/edit").to route_to("armazems#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/armazems").to route_to("armazems#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/armazems/1").to route_to("armazems#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/armazems/1").to route_to("armazems#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/armazems/1").to route_to("armazems#destroy", id: "1")
    end
  end
end
