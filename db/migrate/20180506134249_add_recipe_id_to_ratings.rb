class AddRecipeIdToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :recipe_id, :integer
  end
end