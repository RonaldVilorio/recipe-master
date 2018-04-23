class UsersController < ApplicationController
    
    def new
        # binding.pry
        @user = User.new
    end
    def create
    end
    def show
    end
    def edit
    end
    def update
    end

    private
    def set_user
        @user = User.find(params[:id])
    end
    
end