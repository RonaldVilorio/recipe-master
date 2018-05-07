class RatingsController < ApplicationController
    def create
        # binding.pry
        @rating = Rating.new(rating_params)
        current_user.ratings << @rating
        @recipe = Recipe.find_by(id: params[:rating][:recipe_id])
        @recipe.ratings << @rating
        @user = User.find_by(id: params[:rating][:user_id])
        @recipe.save
        current_user.save
        redirect_to user_recipe_path(@user,@recipe)
        # need to find user and recipe

    end
    def rating_params
        params.require(:rating).permit(:comment,:stars,:recipe_id,user_id: current_user.id)
    end
end