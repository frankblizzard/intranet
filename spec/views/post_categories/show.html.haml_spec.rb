require 'spec_helper'

describe "post_categories/show.html.haml" do
  before(:each) do
    @post_category = assign(:post_category, stub_model(PostCategory,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
