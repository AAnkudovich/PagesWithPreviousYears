class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :userID
      t.integer :voteRating , :default => 0 
      t.timestamps
    end
  end
end
