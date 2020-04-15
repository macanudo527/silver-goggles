class CreateJoinTableEntriesStudySets < ActiveRecord::Migration[6.0]
  def change
    create_join_table :entries, :study_sets do |t|
      	t.index [:entry_id, :study_set_id]
    	t.index [:study_set_id, :entry_id]
    end
  end
end
