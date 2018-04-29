class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    def index
        @recipes = Recipe.all
    end
    def new
        @recipe = Recipe.new
        # form, will use partial
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
        params.require(:recipe).permit()
    end

end