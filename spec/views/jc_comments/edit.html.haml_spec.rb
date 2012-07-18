require 'spec_helper'

describe "jc_comments/edit.html.haml" do
  before(:each) do
    @jc_comment = assign(:jc_comment, stub_model(JcComment))
  end

  it "renders the edit jc_comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jc_comments_path(@jc_comment), :method => "post" do
    end
  end
end
