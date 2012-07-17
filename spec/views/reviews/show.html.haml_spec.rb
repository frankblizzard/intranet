require 'spec_helper'

describe "reviews/show.html.haml" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :name => "Name",
      :project_id => 1,
      :closed => false,
      :project_leader_id => 1,
      :email_when_changed => "Email When Changed",
      :client_emails => "Client Emails"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email When Changed/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Client Emails/)
  end
end
