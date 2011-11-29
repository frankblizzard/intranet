require "spec_helper"

describe WorkCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/work_categories").should route_to("work_categories#index")
    end

    it "routes to #new" do
      get("/work_categories/new").should route_to("work_categories#new")
    end

    it "routes to #show" do
      get("/work_categories/1").should route_to("work_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/work_categories/1/edit").should route_to("work_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/work_categories").should route_to("work_categories#create")
    end

    it "routes to #update" do
      put("/work_categories/1").should route_to("work_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/work_categories/1").should route_to("work_categories#destroy", :id => "1")
    end

  end
end
