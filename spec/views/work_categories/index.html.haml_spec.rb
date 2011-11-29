require 'spec_helper'

describe "work_categories/index.html.haml" do
  before(:each) do
    assign(:work_categories, [
      stub_model(WorkCategory,
        :name => "Name"
      ),
      stub_model(WorkCategory,
        :name => "Name"
      )
    ])
  end

  it "renders a list of work_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
