class CreateHashtagQuestions < ActiveRecord::Migration
  def change
    create_table :hashtag_questions do |t|
    	t.references :question
    	t.references :hashtag

      t.timestamps
    end
  end
end
