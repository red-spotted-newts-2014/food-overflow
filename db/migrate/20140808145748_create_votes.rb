class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.boolean :is_upvote?
    	t.integer :votable_id
    	t.string :votable_type

      t.timestamps
    end
  end
end
