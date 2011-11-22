require 'spec_helper'

describe "clients/new.html.haml" do
  before(:each) do
    assign(:client, stub_model(Client,
      :name => "MyString",
      :full_name => "MyString",
      :client_nr => "MyString",
      :website => "MyString"
    ).as_new_record)
  end

  it "renders new client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clients_path, :method => "post" do
      assert_select "input#client_name", :name => "client[name]"
      assert_select "input#client_full_name", :name => "client[full_name]"
      assert_select "input#client_client_nr", :name => "client[client_nr]"
      assert_select "input#client_website", :name => "client[website]"
    end
  end
end
