class AddIndexStudySet < ActiveRecord::Migration[6.0]
  def change
  	add_index :study_records, [:user_id, :entry_id], unique: true
  end
end
