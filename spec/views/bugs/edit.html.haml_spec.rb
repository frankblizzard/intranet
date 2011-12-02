require 'spec_helper'

describe "bugs/edit.html.haml" do
  before(:each) do
    @bug = assign(:bug, stub_model(Bug,
      :user_id => 1,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit bug form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bugs_path(@bug), :method => "post" do
      assert_select "input#bug_user_id", :name => "bug[user_id]"
      assert_select "input#bug_title", :name => "bug[title]"
      assert_select "textarea#bug_description", :name => "bug[description]"
    end
  end
end
