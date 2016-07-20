class AddIngredientsRecipes < ActiveRecord::Migration
  def change
    create_table(:ingredients_recipes) do |t|
      t.column(:recipe_id, :int)
      t.column(:ingredient_id, :int)
    end
  end
end
