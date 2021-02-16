require "rails_helper"

RSpec.describe VehiclebrandsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/vehiclebrands").to route_to("vehiclebrands#index")
    end

    it "routes to #show" do
      expect(get: "/vehiclebrands/1").to route_to("vehiclebrands#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/vehiclebrands").to route_to("vehiclebrands#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/vehiclebrands/1").to route_to("vehiclebrands#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/vehiclebrands/1").to route_to("vehiclebrands#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/vehiclebrands/1").to route_to("vehiclebrands#destroy", id: "1")
    end
  end
end
