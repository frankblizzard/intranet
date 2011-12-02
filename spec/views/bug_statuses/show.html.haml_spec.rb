require 'spec_helper'

describe "bug_statuses/show.html.haml" do
  before(:each) do
    @bug_status = assign(:bug_status, stub_model(BugStatus,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
