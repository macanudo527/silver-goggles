class AddDueToStudyRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :study_records, :due, :datetime
  end
end
