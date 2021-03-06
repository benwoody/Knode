class KnodesController < ApplicationController

  before_filter :authenticate, :only => [:new, :create, :destroy, :edit, :update, :delete]
  before_filter :authorized_user, :only => [:delete, :destroy]

# tiny MCE controller
  uses_tiny_mce(:options => {
    :theme => 'advanced',
    :browsers => %w{msie gecko},
    :theme_advanced_toolbar_location => "top",
    :theme_advanced_toolbar_align => "left",
    :theme_advanced_resizing => true,
    :theme_advanced_resize_horizontal => false,
    :theme_advanced_statusbar_location=>"bottom",
    :paste_auto_cleanup_on_paste => true,
    :theme_advanced_buttons1 =>
                  %w{formatselect emotions fullscreen bold italic underline separator
link unlink image | justifyleft justifycenter justifyright indent outdent | cleanup
code},
    :theme_advanced_buttons2 => [],
    :theme_advanced_buttons3 => [],
    :plugins => %w{contextmenu emotions fullscreen paste}},
    :content_css=> "css/content.css",
    :only => [:new, :edit, :create, :update])

  # GET /knodes
  # GET /knodes.xml
  def index
    @knodes = Knode.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @knodes }
    end
  end

  # GET /knodes/1
  # GET /knodes/1.xml
  def show
    @knode = Knode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @knode }
    end
  end

  # GET /knodes/new
  # GET /knodes/new.xml
  def new
    @knode = Knode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @knode }
    end
  end

  # GET /knodes/1/edit
  def edit
    @knode = Knode.find(params[:id])
  end

  # POST /knodes
  # POST /knodes.xml
  def create
    @knode = current_user.knodes.build(params[:knode])

    respond_to do |format|
      if @knode.save
        format.html { redirect_to(@knode, :notice => 'Knode was successfully created.') }
        format.xml  { render :xml => @knode, :status => :created, :location => @knode }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @knode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /knodes/1
  # PUT /knodes/1.xml
  def update
    @knode = Knode.find(params[:id])

    respond_to do |format|
      if @knode.update_attributes(params[:knode])
        format.html { redirect_to(@knode, :notice => 'Knode was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @knode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /knodes/1
  # DELETE /knodes/1.xml
  def destroy
    @knode = Knode.find(params[:id])
    @knode.destroy
  end


  private

  def authorized_user
    @knode = Knode.find(params[:id])
    redirect_to root_path unless current_user?(@knode.user)
  end
end
