class BandsController < ApplicationController
  def index
    @bands = Band.find(:all, :order => "name", :select => ["name"]) 
  end
  
   def show
    @band = Band.find(:first, :conditions=> ["id = ?", params[:id]])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @band }
    end
  end
  
end
