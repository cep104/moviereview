class SessionsController < ApplicationController
    def index
    end

    def destroy 
        session.delete(:user_id)
        #deletes sessions user id 
        #if you want to delete the whole session use session.clear 
        redirect_to '/'
    end

    def new 
    end

    def create 
        # does the user exist in the system?
        @user = User.find_by(username: params[:user][:username])
        # did we find some one is it the right password
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to @user
        else
            flash[:error] = "Sorry wrong username or password"
            redirect_to login_path
        end

        
    end

    def omniauth
    @user = User.create_by_google_omniauth(auth)

    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end
    private 

    def auth
        request.env['omniauth.auth']
      end
end
