require "spec_helper"

describe ReviewImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/review_images").should route_to("review_images#index")
    end

    it "routes to #new" do
      get("/review_images/new").should route_to("review_images#new")
    end

    it "routes to #show" do
      get("/review_images/1").should route_to("review_images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/review_images/1/edit").should route_to("review_images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/review_images").should route_to("review_images#create")
    end

    it "routes to #update" do
      put("/review_images/1").should route_to("review_images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/review_images/1").should route_to("review_images#destroy", :id => "1")
    end

  end
end
