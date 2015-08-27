class EditCategoriesRecipesColumns < ActiveRecord::Migration
  def change
    remove_column(:categories_recipes, :category_ids, :integer)
    remove_column(:categories_recipes, :recipe_ids, :integer)

    add_column(:categories_recipes, :category_id, :integer)
    add_column(:categories_recipes, :recipe_id, :integer)
  end
end
