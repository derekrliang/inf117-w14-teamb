class AddGoodExample1AndGoodExample2AndGoodExample3ToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :good_example1, :text
    add_column :categories, :good_example2, :text
    add_column :categories, :good_example3, :text
  end
end
