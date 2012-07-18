require 'spec_helper'

describe "jc_comments/show.html.haml" do
  before(:each) do
    @jc_comment = assign(:jc_comment, stub_model(JcComment))
  end

  it "renders attributes in <p>" do
    render
  end
end
