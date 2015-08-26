class CreateRecipes < ActiveRecord::Migration
  def change
    create_table(:recipes) do |r|
      r.column(:name, :string)
      r.column(:instruction, :text)
      r.column(:ingredient, :text)

      r.timestamps()
    end
  end
end
