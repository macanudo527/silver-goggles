class CreateStudySets < ActiveRecord::Migration[6.0]
  def change
    create_table :study_sets do |t|
      t.integer :user_id
      t.integer :link_id

      t.timestamps
    end
  end
end
