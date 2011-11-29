require 'spec_helper'

describe "work_categories/show.html.haml" do
  before(:each) do
    @work_category = assign(:work_category, stub_model(WorkCategory,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
