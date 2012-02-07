require 'spec_helper'

describe "images/new.html.haml" do
  before(:each) do
    assign(:image, stub_model(Image,
      :name => "MyString",
      :user_id => 1,
      :project_id => 1,
      :rating => 1.5,
      :source => "MyString"
    ).as_new_record)
  end

  it "renders new image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => images_path, :method => "post" do
      assert_select "input#image_name", :name => "image[name]"
      assert_select "input#image_user_id", :name => "image[user_id]"
      assert_select "input#image_project_id", :name => "image[project_id]"
      assert_select "input#image_rating", :name => "image[rating]"
      assert_select "input#image_source", :name => "image[source]"
    end
  end
end
