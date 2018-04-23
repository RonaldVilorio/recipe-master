class UsersController < ApplicationController
    
    def new
        # binding.pry
        @user = User.new
    end
    def create
        binding.pry
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
        else
            render :new
        end
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
    def user_params
        params.require(:user).permit(:name,:password,:email)
    end
    
end