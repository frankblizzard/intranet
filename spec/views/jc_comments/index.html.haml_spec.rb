require 'spec_helper'

describe "jc_comments/index.html.haml" do
  before(:each) do
    assign(:jc_comments, [
      stub_model(JcComment),
      stub_model(JcComment)
    ])
  end

  it "renders a list of jc_comments" do
    render
  end
end
