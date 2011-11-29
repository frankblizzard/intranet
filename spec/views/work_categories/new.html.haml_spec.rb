require 'spec_helper'

describe "work_categories/new.html.haml" do
  before(:each) do
    assign(:work_category, stub_model(WorkCategory,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new work_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => work_categories_path, :method => "post" do
      assert_select "input#work_category_name", :name => "work_category[name]"
    end
  end
end
