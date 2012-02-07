require 'spec_helper'

describe "images/index.html.haml" do
  before(:each) do
    assign(:images, [
      stub_model(Image,
        :name => "Name",
        :user_id => 1,
        :project_id => 1,
        :rating => 1.5,
        :source => "Source"
      ),
      stub_model(Image,
        :name => "Name",
        :user_id => 1,
        :project_id => 1,
        :rating => 1.5,
        :source => "Source"
      )
    ])
  end

  it "renders a list of images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Source".to_s, :count => 2
  end
end
