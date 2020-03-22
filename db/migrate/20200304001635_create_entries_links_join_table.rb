class CreateEntriesLinksJoinTable < ActiveRecord::Migration[6.0]
  def change
  	create_join_table :entries, :links do |t|
  		t.index [:entry_id, :link_id]
  		t.index [:link_id, :entry_id]
  	end
  end
end
