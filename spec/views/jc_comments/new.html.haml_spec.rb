require 'spec_helper'

describe "jc_comments/new.html.haml" do
  before(:each) do
    assign(:jc_comment, stub_model(JcComment).as_new_record)
  end

  it "renders new jc_comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jc_comments_path, :method => "post" do
    end
  end
end
