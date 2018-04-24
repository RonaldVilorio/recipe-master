class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # login authentication
        @user = User.find_by(name: session_params[:name])
        if @user && @user.authenticate(session_params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to login_path
        end
    end

    def destroy
       session.delete :user_id
       redirect_to root_url
    end
    private
    def session_params
        params.require(:user).permit(:name,:password)
    end
end