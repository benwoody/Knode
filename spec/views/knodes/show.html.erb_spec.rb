require 'spec_helper'

describe "knodes/show.html.erb" do
  before(:each) do
    @knode = assign(:knode, stub_model(Knode,
      :title => "Title",
      :info => "Info",
      :media => "Media",
      :links => "Links"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Title".to_s)
    rendered.should contain("Info".to_s)
    rendered.should contain("Media".to_s)
    rendered.should contain("Links".to_s)
  end
end
