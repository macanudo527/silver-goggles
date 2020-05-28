class ChangeColumnMasteryDefault < ActiveRecord::Migration[6.0]
  def change
  	change_column :study_records, :mastery, :integer, default: 0
  end
end
