require "spec_helper"

describe BugStatusesController do
  describe "routing" do

    it "routes to #index" do
      get("/bug_statuses").should route_to("bug_statuses#index")
    end

    it "routes to #new" do
      get("/bug_statuses/new").should route_to("bug_statuses#new")
    end

    it "routes to #show" do
      get("/bug_statuses/1").should route_to("bug_statuses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bug_statuses/1/edit").should route_to("bug_statuses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bug_statuses").should route_to("bug_statuses#create")
    end

    it "routes to #update" do
      put("/bug_statuses/1").should route_to("bug_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bug_statuses/1").should route_to("bug_statuses#destroy", :id => "1")
    end

  end
end
