class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in , except: [:new, :create]
  before_action :redirect_if_logged_in , only: [:new, :create]

 def index
  @users = User.all
 end 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      flash[:notice] = "You have succesfully signed up!" 
    else
      render :new
      flash[:error] = @user.errors.full_messages
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(dreams_params)
      redirect_to @user
    else
      render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end
