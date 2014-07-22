class ChangeSentenceFormatInResponses < ActiveRecord::Migration
  def up
    change_column :responses, :sentence1, :text
    change_column :responses, :sentence2, :text
    change_column :responses, :sentence3, :text

    change_column :responses, :revised_sentence1, :text
    change_column :responses, :revised_sentence2, :text
    change_column :responses, :revised_sentence3, :text
    
    change_column :responses, :best_sentence_feedback, :text
    change_column :responses, :worst_sentence_feedback, :text
  end
  
  def down
    change_column :responses, :sentence1, :string
    change_column :responses, :sentence2, :string
    change_column :responses, :sentence3, :string

    change_column :responses, :revised_sentence1, :string
    change_column :responses, :revised_sentence2, :string
    change_column :responses, :revised_sentence3, :string
    
    change_column :responses, :best_sentence_feedback, :string
    change_column :responses, :worst_sentence_feedback, :string
  end
end
