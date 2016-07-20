class CreateRecipes < ActiveRecord::Migration
  def change
    create_table(:recipes) do |t|
      t.column(:name, :varchar)
    end
  end
end
