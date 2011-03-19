require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :uname => "Uname",
      :fullname => "Fullname",
      :email => "Email",
      :admin => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Uname".to_s)
    rendered.should contain("Fullname".to_s)
    rendered.should contain("Email".to_s)
    rendered.should contain(1.to_s)
  end
end
