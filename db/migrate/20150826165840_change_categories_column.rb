class ChangeCategoriesColumn < ActiveRecord::Migration
  def change
    remove_column(:categories, :type, :string)

    add_column(:categories, :name, :string)
  end
end
