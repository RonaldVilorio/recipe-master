class RecipesController < ApplicationController
    before_action :set_recipe, only: [ :update, :destroy]
    def index
        set_user ? @recipes = @user.recipes : @recipes = Recipe.all
    end
    def new
        
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to users_path, alert: "User not found"
        else
            @recipe = Recipe.new(user_id: params[:user_id])
            build_ingredients
        end
        
    end
    def create
        
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end
    def show
        set_user
        @recipe = @user.recipes.find_by(id: params[:id])
    end
    def edit
        redirect_if_unauthorized
        set_user
        # or statement just in case user navigates to a recipe that was deleted
        @recipe = @user.recipes.find_by(id: params[:id])
        if @recipe.nil?
            redirect_to user_recipes_path(@user)
        end

    end
    def update
        # binding.pry
        # going to find a way to stop duplicates from coming in
        # figure out why enter ingredient below is connected to choosing pre existing ingredient
        @user = User.find_by(id: params[:recipe][:user_id])
        @recipe.update(recipe_params) ? (redirect_to user_recipe_path(@user)) : (render :edit)
    end
    def destroy
        redirect_if_unauthorized
        @recipe.destroy
        # Will need to decide where to redirect here
    end
    private
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
    def recipe_params
        params.require(:recipe).permit(:content,:name,:user_id,ingredient_ids:[],ingredients_attributes:[
            :name
        ])
        # ingredient_ids will be taken care by active record
        # ingredients_attributes is handled by a method I created in recipe class
    end
    def build_ingredients
        5.times do
            @recipe.ingredients.build
        end
    end
    def set_user
        @user = User.find_by(id: params[:user_id])
    end

end