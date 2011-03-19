require "spec_helper"

describe KnodesController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/knodes" }.should route_to(:controller => "knodes", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/knodes/new" }.should route_to(:controller => "knodes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/knodes/1" }.should route_to(:controller => "knodes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/knodes/1/edit" }.should route_to(:controller => "knodes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/knodes" }.should route_to(:controller => "knodes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/knodes/1" }.should route_to(:controller => "knodes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/knodes/1" }.should route_to(:controller => "knodes", :action => "destroy", :id => "1")
    end

  end
end
