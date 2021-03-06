class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.text :title
      t.longtext :content
      t.string :slug
      t.integer :parentPage
      t.string :template

      t.timestamps
    end
  end
end
