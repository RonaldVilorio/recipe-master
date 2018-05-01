class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :ratings
    accepts_nested_attributes_for :ingredients reject_if: proc { |attributes| attributes['name'].blank? }
    
end
