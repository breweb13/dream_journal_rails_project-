class SessionsController < ApplicationController
   
    def welcome
    end

    def new 
        @user = User.new
    end

    def google
    end


 def destroy 
        session.delete(:user_id)
        redirect_to '/login'
    end

    def create 
        #if they are logging in the "normal" way
        #binding.pry
        u = User.find_by_email(params[:user][:email])
        if u && u.authenticate(params[:user][:password])
            session[:user_id] = u.id
            redirect_to user_path(u)
        else
            redirect_to '/login'
        end
    end

    def google #if they are logging in with oauth
        # if that user has already logged in this way
        user = User.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
            u.email = auth["info"]["email"]
            u.password = SecureRandom.hex(10)
            u.name = auth["info"]["name"]
        end

        # check that they register successful
        if user.valid? 
            session[:user_id] = user.id   #log them in
            redirect_to user_path(user)
        else
            flash[:message] = "Whoops! Something's wrong!"
            redirect_to login_path
        end
    end

    private 

    def auth 
        request.env['omniauth.auth'] #hash 
    end

end