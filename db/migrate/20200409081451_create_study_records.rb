class CreateStudyRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :study_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :entry, null: false, foreign_key: true
      t.integer :mastery

      t.timestamps
    end
  end
end
