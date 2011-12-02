require 'spec_helper'

describe "bug_statuses/edit.html.haml" do
  before(:each) do
    @bug_status = assign(:bug_status, stub_model(BugStatus,
      :name => "MyString"
    ))
  end

  it "renders the edit bug_status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bug_statuses_path(@bug_status), :method => "post" do
      assert_select "input#bug_status_name", :name => "bug_status[name]"
    end
  end
end
