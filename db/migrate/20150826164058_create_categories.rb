class CreateCategories < ActiveRecord::Migration
  def change
    create_table(:categories) do |c|
      c.column(:type, :string)

      c.timestamps()
    end
  end
end
