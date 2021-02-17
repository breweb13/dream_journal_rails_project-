module ApplicationHelper
  
  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end


  def logged_in
    !!current_user
  end

  def redirect_if_not_logged_in
    redirect_to '/login' unless logged_in
  end

  def redirect_if_logged_in
      redirect_to user_path(current_user) if logged_in
  end

end
