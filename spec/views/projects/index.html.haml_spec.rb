require 'spec_helper'

describe "projects/index.html.haml" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :nr => "Nr",
        :name => "Name",
        :client_id => 1,
        :description => "MyText",
        :active => false,
        :hidden => false
      ),
      stub_model(Project,
        :nr => "Nr",
        :name => "Name",
        :client_id => 1,
        :description => "MyText",
        :active => false,
        :hidden => false
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nr".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
