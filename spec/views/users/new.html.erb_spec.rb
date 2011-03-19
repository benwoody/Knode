require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(User,
      :new_record? => true,
      :uname => "MyString",
      :fullname => "MyString",
      :email => "MyString",
      :admin => 1
    ))
  end

  it "renders new user form" do
    render

    rendered.should have_selector("form", :action => users_path, :method => "post") do |form|
      form.should have_selector("input#user_uname", :name => "user[uname]")
      form.should have_selector("input#user_fullname", :name => "user[fullname]")
      form.should have_selector("input#user_email", :name => "user[email]")
      form.should have_selector("input#user_admin", :name => "user[admin]")
    end
  end
end
