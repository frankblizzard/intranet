require 'spec_helper'

describe "bug_statuses/new.html.haml" do
  before(:each) do
    assign(:bug_status, stub_model(BugStatus,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new bug_status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bug_statuses_path, :method => "post" do
      assert_select "input#bug_status_name", :name => "bug_status[name]"
    end
  end
end
