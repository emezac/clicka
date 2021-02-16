require "rails_helper"

RSpec.describe VehiclemodelsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/vehiclemodels").to route_to("vehiclemodels#index")
    end

    it "routes to #show" do
      expect(get: "/vehiclemodels/1").to route_to("vehiclemodels#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/vehiclemodels").to route_to("vehiclemodels#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/vehiclemodels/1").to route_to("vehiclemodels#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/vehiclemodels/1").to route_to("vehiclemodels#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/vehiclemodels/1").to route_to("vehiclemodels#destroy", id: "1")
    end
  end
end
