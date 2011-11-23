require 'spec_helper'

describe "Login Required" do
  it "does not allow access to any pages without being logged in" do
    user = Factory(:user)
    visit projects_path
    
  end
end
