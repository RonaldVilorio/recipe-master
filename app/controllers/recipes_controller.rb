class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    def index
        @recipes = Recipe.all
    end
    def new
        binding.pry
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to users_path, alert: "User not found"
        else
            @recipe = Recipe.new(user_id: params[:user_id])
            build_ingredients
        end
        
    end
    def create
        # binding.pry
    #   raise params.inspect
        @recipe = current_user.recipes.build(recipe_params)
    end
    def show 
    end
    def edit
    end
    def update
    end
    def destroy
        @recipe.destroy
        # Will need to decide where to redirect here
    end
    private
    def set_recipe
        @recipe = Recipe.find(params[:id])
    end
    def recipe_params
        # modify
        params.require(:recipe).permit(:content,:name,ingredient_ids[],ingredients_attributes[
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

end