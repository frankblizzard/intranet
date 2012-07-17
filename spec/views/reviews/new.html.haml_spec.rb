require 'spec_helper'

describe "reviews/new.html.haml" do
  before(:each) do
    assign(:review, stub_model(Review,
      :name => "MyString",
      :project_id => 1,
      :closed => false,
      :project_leader_id => 1,
      :email_when_changed => "MyString",
      :client_emails => "MyString"
    ).as_new_record)
  end

  it "renders new review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reviews_path, :method => "post" do
      assert_select "input#review_name", :name => "review[name]"
      assert_select "input#review_project_id", :name => "review[project_id]"
      assert_select "input#review_closed", :name => "review[closed]"
      assert_select "input#review_project_leader_id", :name => "review[project_leader_id]"
      assert_select "input#review_email_when_changed", :name => "review[email_when_changed]"
      assert_select "input#review_client_emails", :name => "review[client_emails]"
    end
  end
end
