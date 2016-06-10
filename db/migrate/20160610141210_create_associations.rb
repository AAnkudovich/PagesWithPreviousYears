class CreateAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :associations do |t|
      t.string :pagename
      t.integer :pageID

      t.timestamps
    end
  end
end
