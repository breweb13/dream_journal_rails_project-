module ApplicationHelper
  
  def current_user
    @current_user ||=User.find_by_id(session[:user_id]) if session[:user_id]
  end


  def logged_in
    !!current_user
  end

  def authorized_to_edit?(dream)
    dream.user == current_user
  end

  def redirect_if_not_logged_in
    redirect_to '/login' unless logged_in
  end

  def redirect_if_logged_in
      redirect_to user_path(current_user) if logged_in
  end

end
