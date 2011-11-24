require 'spec_helper'



describe "Clients" do
  
  before(:each) do
    @user = login_user
    profile = @user.profile
    profile.should_receive(:avatar).and_return("dummy.jpg")
    controller.stub!(:current_user).and_return(profile)
  end

  
  it "allows access when logged in" do
    visit new_user_session_path
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    click_button "Sign in"
    visit clients_path 
    #response.should render_template("users/sign_in")
    page.should have_content("Listing clients")
  end
  
  
end
