require 'spec_helper'

describe "Login Required" do
  it "does not allow access to any pages without being logged in" do
    user = Factory(:user)
    visit projects_path
    #response.should render_template("users/sign_in")
    page.should have_content("You need to sign in or sign up before continuing")
  end
end
