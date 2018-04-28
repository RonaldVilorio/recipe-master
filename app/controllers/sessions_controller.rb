class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: session_params[:name])
        if @user && @user.authenticate(session_params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to login_path
        end
    end
    def omnicreate
    
        if auth_hash
            @user = User.find_or_create_by_omniauth(auth_hash)
            
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
        
    end

    def destroy
       session.delete :user_id
       redirect_to root_url
    end
    private
    def auth_hash
        request.env['omniauth.auth']
    end
    def session_params
        params.require(:user).permit(:name,:password)
    end
end