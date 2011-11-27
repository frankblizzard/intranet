require 'spec_helper'

describe "hours/edit.html.haml" do
  before(:each) do
    @hour = assign(:hour, stub_model(Hour,
      :amount => 1.5,
      :extra => false,
      :holiday => false,
      :ill => false,
      :project_id => 1,
      :user_id => 1,
      :task_id => ""
    ))
  end

  it "renders the edit hour form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => hours_path(@hour), :method => "post" do
      assert_select "input#hour_amount", :name => "hour[amount]"
      assert_select "input#hour_extra", :name => "hour[extra]"
      assert_select "input#hour_holiday", :name => "hour[holiday]"
      assert_select "input#hour_ill", :name => "hour[ill]"
      assert_select "input#hour_project_id", :name => "hour[project_id]"
      assert_select "input#hour_user_id", :name => "hour[user_id]"
      assert_select "input#hour_task_id", :name => "hour[task_id]"
    end
  end
end
