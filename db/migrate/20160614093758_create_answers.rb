class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :userID
      t.integer :voteRating

      t.timestamps
    end
  end
end
