class LoginsController < ApplicationController

  def index
    if request.post?
      begin
        session['user_id'] = User.authenticate(params[:username], params[:password]).id
      rescue => exception
        flash[:error] = "Error: #{exception}"
        @username = params[:username]
      end
      if !exception
        redirect_to :controller => 'users'
      end
    else
      flash[:error] = nil      
    end
  end

  def logout
    session['user_id'] = nil
    redirect_to :controller=>'login'
  end
  
 
end
