class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :sentence1
      t.string :sentence2
      t.string :sentence3
      t.integer :question_id
      t.references :user, index: true
      t.integer :reviewer_id
      t.string :revised_sentence1
      t.string :revised_sentence2
      t.string :revised_sentence3
      t.integer :question_id
      t.integer :best_sentence
      t.integer :worst_sentence
      t.string :best_sentence_feedback
      t.string :worst_sentence_feedback

      t.timestamps
    end
  end
end
