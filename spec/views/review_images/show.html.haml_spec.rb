require 'spec_helper'

describe "review_images/show.html.haml" do
  before(:each) do
    @review_image = assign(:review_image, stub_model(ReviewImage,
      :review_id => 1,
      :name => "Name",
      :project_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
