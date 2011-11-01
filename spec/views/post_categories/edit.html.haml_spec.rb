require 'spec_helper'

describe "post_categories/edit.html.haml" do
  before(:each) do
    @post_category = assign(:post_category, stub_model(PostCategory,
      :name => "MyString"
    ))
  end

  it "renders the edit post_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => post_categories_path(@post_category), :method => "post" do
      assert_select "input#post_category_name", :name => "post_category[name]"
    end
  end
end
