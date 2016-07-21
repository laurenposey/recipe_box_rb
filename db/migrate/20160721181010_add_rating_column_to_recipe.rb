class AddRatingColumnToRecipe < ActiveRecord::Migration
  def change
    add_column(:recipes, :rating, :int)
  end
end
