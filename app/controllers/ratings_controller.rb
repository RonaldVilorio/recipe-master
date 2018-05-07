class RatingsController < ApplicationController
    def create
        # @rating = current_user.ratings.build(rating_params)
        @rating = Rating.new(rating_params)
        @rating.save
        current_user.ratings << @rating
        @recipe_show = Recipe.find_by(id: params[:rating][:recipe_id])
        @recipe_show.ratings << @rating
        @user = User.find_by(id: params[:rating][:user_id])
        @recipe_show.save
        current_user.save
        redirect_to user_recipe_path(@user,@recipe_show)
        # make sure this is best way of doing this

    end
    def rating_params
        params.require(:rating).permit(:comment,:stars,:recipe_id,user_id: current_user.id)
    end
end