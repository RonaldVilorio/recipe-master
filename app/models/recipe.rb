class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :ratings
    # accepts_nested_attributes_for :ingredients, reject_if: proc { |attributes| attributes['name'].blank? }
    def ingredients_attributes=(ingredients_attributes)
        ingredients_attributes.values.each do |ingredient_attribute|
            if ingredient_attribute != "" && ingredient_attribute != nil
                Ingredient.find_or_create_by(name: ingredient_attribute)
            end
        end
    end
    # You could also place an i for the number and have ingredient_attribute for the value to test.
    # def ingredients_attributes=(ingredients_attributes)
    # ingredients_attributes.each do |i,ingredient_attribute|
            
    end
end
    
end
