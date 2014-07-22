class RemoveBadExampleFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :bad_example, :string
  end
end
