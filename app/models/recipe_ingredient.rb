class RecipeIngredient < ApplicationRecord
    belongs_to :recipe 
    belongs_to :ingredient
end
class RecipeIngredient < ApplicationRecord
   belongs_to :recipe
   belongs_to :ingredient
  end