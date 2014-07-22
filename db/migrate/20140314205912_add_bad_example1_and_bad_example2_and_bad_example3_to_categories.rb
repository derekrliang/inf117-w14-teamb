class AddBadExample1AndBadExample2AndBadExample3ToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :bad_example1, :text
    add_column :categories, :bad_example2, :text
    add_column :categories, :bad_example3, :text
  end
end
