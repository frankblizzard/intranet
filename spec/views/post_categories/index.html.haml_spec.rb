require 'spec_helper'

describe "post_categories/index.html.haml" do
  before(:each) do
    assign(:post_categories, [
      stub_model(PostCategory,
        :name => "Name"
      ),
      stub_model(PostCategory,
        :name => "Name"
      )
    ])
  end

  it "renders a list of post_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
