class ChangeDataTypeForPageName < ActiveRecord::Migration[5.0]
  def change
  	change_column(:associations, :pagename, :text)
  end
end
