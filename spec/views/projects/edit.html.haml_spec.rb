require 'spec_helper'

describe "projects/edit.html.haml" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :nr => "MyString",
      :name => "MyString",
      :client_id => 1,
      :description => "MyText",
      :active => false,
      :hidden => false
    ))
  end

  it "renders the edit project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path(@project), :method => "post" do
      assert_select "input#project_nr", :name => "project[nr]"
      assert_select "input#project_name", :name => "project[name]"
      assert_select "input#project_client_id", :name => "project[client_id]"
      assert_select "textarea#project_description", :name => "project[description]"
      assert_select "input#project_active", :name => "project[active]"
      assert_select "input#project_hidden", :name => "project[hidden]"
    end
  end
end
