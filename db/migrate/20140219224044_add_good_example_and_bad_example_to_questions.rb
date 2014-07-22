class AddGoodExampleAndBadExampleToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :good_example, :string
    add_column :questions, :bad_example, :string
  end
end
