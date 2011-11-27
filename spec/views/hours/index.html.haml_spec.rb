require 'spec_helper'

describe "hours/index.html.haml" do
  before(:each) do
    assign(:hours, [
      stub_model(Hour,
        :amount => 1.5,
        :extra => false,
        :holiday => false,
        :ill => false,
        :project_id => 1,
        :user_id => 1,
        :task_id => ""
      ),
      stub_model(Hour,
        :amount => 1.5,
        :extra => false,
        :holiday => false,
        :ill => false,
        :project_id => 1,
        :user_id => 1,
        :task_id => ""
      )
    ])
  end

  it "renders a list of hours" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
