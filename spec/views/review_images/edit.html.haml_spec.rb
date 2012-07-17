require 'spec_helper'

describe "review_images/edit.html.haml" do
  before(:each) do
    @review_image = assign(:review_image, stub_model(ReviewImage,
      :review_id => 1,
      :name => "MyString",
      :project_id => 1
    ))
  end

  it "renders the edit review_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => review_images_path(@review_image), :method => "post" do
      assert_select "input#review_image_review_id", :name => "review_image[review_id]"
      assert_select "input#review_image_name", :name => "review_image[name]"
      assert_select "input#review_image_project_id", :name => "review_image[project_id]"
    end
  end
end
