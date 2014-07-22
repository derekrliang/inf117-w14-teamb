class AddCategoryToResponses < ActiveRecord::Migration
  def change
    add_reference :responses, :category, index: true
  end
end
