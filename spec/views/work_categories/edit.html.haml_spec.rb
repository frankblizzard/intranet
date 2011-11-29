require 'spec_helper'

describe "work_categories/edit.html.haml" do
  before(:each) do
    @work_category = assign(:work_category, stub_model(WorkCategory,
      :name => "MyString"
    ))
  end

  it "renders the edit work_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => work_categories_path(@work_category), :method => "post" do
      assert_select "input#work_category_name", :name => "work_category[name]"
    end
  end
end
