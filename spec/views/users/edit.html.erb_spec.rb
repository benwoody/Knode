require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :new_record? => false,
      :uname => "MyString",
      :fullname => "MyString",
      :email => "MyString",
      :admin => 1
    ))
  end

  it "renders the edit user form" do
    render

    rendered.should have_selector("form", :action => user_path(@user), :method => "post") do |form|
      form.should have_selector("input#user_uname", :name => "user[uname]")
      form.should have_selector("input#user_fullname", :name => "user[fullname]")
      form.should have_selector("input#user_email", :name => "user[email]")
      form.should have_selector("input#user_admin", :name => "user[admin]")
    end
  end
end
