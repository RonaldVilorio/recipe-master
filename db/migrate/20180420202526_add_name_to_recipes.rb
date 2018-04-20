class AddNameToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :name, :string
  end
end
