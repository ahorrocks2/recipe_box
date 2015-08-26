class ChangeJoinTableColumns < ActiveRecord::Migration
  def change
    remove_column(:categories_recipes, :category_id, :integer)
    remove_column(:categories_recipes, :recipe_id, :integer)

    add_column(:categories_recipes, :category_ids, :integer)
    add_column(:categories_recipes, :recipe_ids, :integer)    

  end
end
