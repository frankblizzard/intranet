require "spec_helper"

describe JcCommentsController do
  describe "routing" do

    it "routes to #index" do
      get("/jc_comments").should route_to("jc_comments#index")
    end

    it "routes to #new" do
      get("/jc_comments/new").should route_to("jc_comments#new")
    end

    it "routes to #show" do
      get("/jc_comments/1").should route_to("jc_comments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/jc_comments/1/edit").should route_to("jc_comments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/jc_comments").should route_to("jc_comments#create")
    end

    it "routes to #update" do
      put("/jc_comments/1").should route_to("jc_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/jc_comments/1").should route_to("jc_comments#destroy", :id => "1")
    end

  end
end
