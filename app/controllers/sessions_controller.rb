class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, except: [:destroy]
  def welcome
  end

  def new 
      @user = User.new
  end

  def destroy 
      session.delete(:user_id)
      redirect_to '/login'
  end

  def create 
      
      u = User.find_by_email(params[:user][:email])
      if u && u.authenticate(params[:user][:password])
          session[:user_id] = u.id
          redirect_to user_path(u)
      else
          redirect_to '/login'
      end
  end

end