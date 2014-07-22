class RemoveGoodExampleFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :good_example, :string
  end
end
