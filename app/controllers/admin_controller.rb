class AdminController < ApplicationController
  before_filter :check_authentication, :except => ["signup","login"]
  
  def index
    
  end

  def login
    if params[:username]
      begin
        session['user_id'] = User.authenticate(params[:username], params[:password]).id
     rescue => exception
        flash[:error] = "Error: #{exception}"
      end
      redirect_to :action => session[:intended_action] if !exception
    end
  end

  def logout
    session['user_id'] = nil
    redirect_to :action => "login"
  end
  
  private
  
    def check_authentication
      unless session['user_id']
        session[:intended_action] = action_name
        redirect_to :action => "login"
      end
    end
  
end