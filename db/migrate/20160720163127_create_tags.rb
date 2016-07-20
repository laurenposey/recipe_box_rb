class CreateTags < ActiveRecord::Migration
  def change
    create_table(:tags) do |t|
      t.column(:name, :varchar)
    end
  end
end
