class AddGoodExampleAndBadExampleToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :good_example, :string
    add_column :categories, :bad_example, :string
  end
end
