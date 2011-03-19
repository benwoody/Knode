require 'spec_helper'

describe "knodes/edit.html.erb" do
  before(:each) do
    @knode = assign(:knode, stub_model(Knode,
      :new_record? => false,
      :title => "MyString",
      :info => "MyString",
      :media => "MyString",
      :links => "MyString"
    ))
  end

  it "renders the edit knode form" do
    render

    rendered.should have_selector("form", :action => knode_path(@knode), :method => "post") do |form|
      form.should have_selector("input#knode_title", :name => "knode[title]")
      form.should have_selector("input#knode_info", :name => "knode[info]")
      form.should have_selector("input#knode_media", :name => "knode[media]")
      form.should have_selector("input#knode_links", :name => "knode[links]")
    end
  end
end
