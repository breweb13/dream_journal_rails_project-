class ApplicationController < ActionController::Base
  include ApplicationHelper
 
  def current_user
    @current_user ||=User.find_by_id(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user
  

  


  private

 
 

end