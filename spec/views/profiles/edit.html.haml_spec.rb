require 'spec_helper'

describe "profiles/edit.html.haml" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :first_name => "MyString",
      :last_name => "MyString",
      :street => "MyString",
      :zip => "MyString",
      :city => "MyString",
      :bio => "MyText",
      :avatar => "MyString",
      :phone => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profiles_path(@profile), :method => "post" do
      assert_select "input#profile_first_name", :name => "profile[first_name]"
      assert_select "input#profile_last_name", :name => "profile[last_name]"
      assert_select "input#profile_street", :name => "profile[street]"
      assert_select "input#profile_zip", :name => "profile[zip]"
      assert_select "input#profile_city", :name => "profile[city]"
      assert_select "textarea#profile_bio", :name => "profile[bio]"
      assert_select "input#profile_avatar", :name => "profile[avatar]"
      assert_select "input#profile_phone", :name => "profile[phone]"
      assert_select "input#profile_user_id", :name => "profile[user_id]"
    end
  end
end
