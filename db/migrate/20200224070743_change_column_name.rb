class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
 	rename_column :clicks, :clicks, :click_count
  end
end
