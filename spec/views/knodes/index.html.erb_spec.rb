require 'spec_helper'

describe "knodes/index.html.erb" do
  before(:each) do
    assign(:knodes, [
      stub_model(Knode,
        :title => "Title",
        :info => "Info",
        :media => "Media",
        :links => "Links"
      ),
      stub_model(Knode,
        :title => "Title",
        :info => "Info",
        :media => "Media",
        :links => "Links"
      )
    ])
  end

  it "renders a list of knodes" do
    render
    rendered.should have_selector("tr>td", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Info".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Media".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Links".to_s, :count => 2)
  end
end
