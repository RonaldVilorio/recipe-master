class SessionsController < ApplicationController
    def new
        @user = User.new
        # login form
    end

    def create
        # login authentication
    end

    def destroy
       session.delete :user_id
       redirect_to root_url
    end
end