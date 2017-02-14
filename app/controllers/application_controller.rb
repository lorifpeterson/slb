# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

require 'simple_record'

AWS_ACCESS_KEY_ID='AKIAIZE5LSKTKOT65FPQ'
AWS_SECRET_ACCESS_KEY='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'

SimpleRecord.establish_connection(AWS_ACCESS_KEY_ID,AWS_SECRET_ACCESS_KEY, { :connection_mode => :per_thread, :s3_bucket => :new })

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :get_user
  after_filter :close_sdb_connection

  def close_sdb_connection
    SimpleRecord.close_connection
  end

  def get_user
    if session['user_id']
      @current_user = User.find(session['user_id'])
    end  
  end

  def check_authentication
    unless session['user_id']
      session[:intended_action] = action_name
      redirect_to :controller=>'login'
    end
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
