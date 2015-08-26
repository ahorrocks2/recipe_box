class CreateCategoriesRecipes < ActiveRecord::Migration
  def change
    create_table(:categories_recipes) do |cr|
      cr.column(:category_id, :integer)
      cr.column(:recipe_id, :integer)

      cr.timestamps()
    end
  end
end
