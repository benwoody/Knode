require 'spec_helper'

describe KnodesController do

  def mock_knode(stubs={})
    @mock_knode ||= mock_model(Knode, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all knodes as @knodes" do
      Knode.stub(:all) { [mock_knode] }
      get :index
      assigns(:knodes).should eq([mock_knode])
    end
  end

  describe "GET show" do
    it "assigns the requested knode as @knode" do
      Knode.stub(:find).with("37") { mock_knode }
      get :show, :id => "37"
      assigns(:knode).should be(mock_knode)
    end
  end

  describe "GET new" do
    it "assigns a new knode as @knode" do
      Knode.stub(:new) { mock_knode }
      get :new
      assigns(:knode).should be(mock_knode)
    end
  end

  describe "GET edit" do
    it "assigns the requested knode as @knode" do
      Knode.stub(:find).with("37") { mock_knode }
      get :edit, :id => "37"
      assigns(:knode).should be(mock_knode)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created knode as @knode" do
        Knode.stub(:new).with({'these' => 'params'}) { mock_knode(:save => true) }
        post :create, :knode => {'these' => 'params'}
        assigns(:knode).should be(mock_knode)
      end

      it "redirects to the created knode" do
        Knode.stub(:new) { mock_knode(:save => true) }
        post :create, :knode => {}
        response.should redirect_to(knode_url(mock_knode))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved knode as @knode" do
        Knode.stub(:new).with({'these' => 'params'}) { mock_knode(:save => false) }
        post :create, :knode => {'these' => 'params'}
        assigns(:knode).should be(mock_knode)
      end

      it "re-renders the 'new' template" do
        Knode.stub(:new) { mock_knode(:save => false) }
        post :create, :knode => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested knode" do
        Knode.should_receive(:find).with("37") { mock_knode }
        mock_knode.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :knode => {'these' => 'params'}
      end

      it "assigns the requested knode as @knode" do
        Knode.stub(:find) { mock_knode(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:knode).should be(mock_knode)
      end

      it "redirects to the knode" do
        Knode.stub(:find) { mock_knode(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(knode_url(mock_knode))
      end
    end

    describe "with invalid params" do
      it "assigns the knode as @knode" do
        Knode.stub(:find) { mock_knode(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:knode).should be(mock_knode)
      end

      it "re-renders the 'edit' template" do
        Knode.stub(:find) { mock_knode(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested knode" do
      Knode.should_receive(:find).with("37") { mock_knode }
      mock_knode.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the knodes list" do
      Knode.stub(:find) { mock_knode }
      delete :destroy, :id => "1"
      response.should redirect_to(knodes_url)
    end
  end

end
