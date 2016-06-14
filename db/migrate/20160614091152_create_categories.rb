class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :parentId
      t.integer :questionCount

      t.timestamps
    end
  end
end
