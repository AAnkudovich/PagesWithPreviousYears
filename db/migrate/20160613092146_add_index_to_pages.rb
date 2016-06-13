class AddIndexToPages < ActiveRecord::Migration[5.0]
  def change
  	add_index(:pages, [:parentPage])
  	add_index(:pages, [:id])
  end
end
