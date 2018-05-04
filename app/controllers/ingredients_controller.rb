class IngredientsController < ApplicationController
    def index
        # Here we are going to add links to recipes for that particular ingredient
        @ingredients = Ingredient.all
    end
end