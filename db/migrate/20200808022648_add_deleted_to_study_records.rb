class AddDeletedToStudyRecords < ActiveRecord::Migration[6.0]
  def change
  	add_column :study_records, :deleted, :boolean, :default => false
  end
end
