require "spec_helper"

describe KitesController do
  describe "routing" do

    it "routes to #index" do
      get("/kites").should route_to("kites#index")
    end

    it "routes to #new" do
      get("/kites/new").should route_to("kites#new")
    end

    it "routes to #show" do
      get("/kites/1").should route_to("kites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/kites/1/edit").should route_to("kites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/kites").should route_to("kites#create")
    end

    it "routes to #update" do
      put("/kites/1").should route_to("kites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/kites/1").should route_to("kites#destroy", :id => "1")
    end

  end
end
