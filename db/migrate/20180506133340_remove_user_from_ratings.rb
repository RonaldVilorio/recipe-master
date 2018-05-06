class RemoveUserFromRatings < ActiveRecord::Migration[5.2]
  def change
    remove_column :ratings, :user, :string
  end
end
