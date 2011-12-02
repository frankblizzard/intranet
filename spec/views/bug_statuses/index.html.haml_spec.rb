require 'spec_helper'

describe "bug_statuses/index.html.haml" do
  before(:each) do
    assign(:bug_statuses, [
      stub_model(BugStatus,
        :name => "Name"
      ),
      stub_model(BugStatus,
        :name => "Name"
      )
    ])
  end

  it "renders a list of bug_statuses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
