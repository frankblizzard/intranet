require 'spec_helper'

describe "assignments/edit.html.haml" do
  before(:each) do
    @assignment = assign(:assignment, stub_model(Assignment,
      :profile_id => 1,
      :project_id => 1,
      :role => "MyString"
    ))
  end

  it "renders the edit assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assignments_path(@assignment), :method => "post" do
      assert_select "input#assignment_profile_id", :name => "assignment[profile_id]"
      assert_select "input#assignment_project_id", :name => "assignment[project_id]"
      assert_select "input#assignment_role", :name => "assignment[role]"
    end
  end
end
