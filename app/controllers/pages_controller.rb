class PagesController < ApplicationController

  def home
   @title = "Home"
  # @knodes = Knodes.new if signed_in?
  end

  def about
   @title = "About"
  end

  def contact
   @title = "Contact"
  end
  
end
