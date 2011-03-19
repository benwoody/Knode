require 'spec_helper'

describe "users/index.html.erb" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :uname => "Uname",
        :fullname => "Fullname",
        :email => "Email",
        :admin => 1
      ),
      stub_model(User,
        :uname => "Uname",
        :fullname => "Fullname",
        :email => "Email",
        :admin => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    rendered.should have_selector("tr>td", :content => "Uname".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Fullname".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Email".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
