class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :name
      t.text :content
      t.integer :userID
      t.decimal :voteRating , :default => 0 
      t.boolean :resolved , :default => 0 
      t.integer :viewCount , :default => 0 
      t.integer :answerCount , :default => 0 

      t.timestamps
    end
  end
end
