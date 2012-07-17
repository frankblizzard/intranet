require 'spec_helper'

describe "reviews/index.html.haml" do
  before(:each) do
    assign(:reviews, [
      stub_model(Review,
        :name => "Name",
        :project_id => 1,
        :closed => false,
        :project_leader_id => 1,
        :email_when_changed => "Email When Changed",
        :client_emails => "Client Emails"
      ),
      stub_model(Review,
        :name => "Name",
        :project_id => 1,
        :closed => false,
        :project_leader_id => 1,
        :email_when_changed => "Email When Changed",
        :client_emails => "Client Emails"
      )
    ])
  end

  it "renders a list of reviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email When Changed".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Client Emails".to_s, :count => 2
  end
end
