class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :name
      t.text :content
      t.integer :userID
      t.decimal :voteRating
      t.boolean :resolved
      t.integer :viewCount
      t.integer :answerCount

      t.timestamps
    end
  end
end
