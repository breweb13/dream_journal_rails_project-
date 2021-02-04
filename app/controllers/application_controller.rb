
class ApplicationController < ActionController::Base
  
  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]

  private

  def redirect_if_not_logged_in
      redirect_to '/login' if !logged_in?
  end

  def redirect_if_logged_in
      redirect_to user_path(current_user) if logged_in?
  end

  def find_dreamjournal
    @dreamjournal = DreamJournal.find(params[:id])
end

def find_dream
    @dream = Dream.find(params[:id])
end
 
  end

end