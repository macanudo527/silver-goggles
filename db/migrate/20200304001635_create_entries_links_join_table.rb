class CreateEntriesLinksJoinTable < ActiveRecord::Migration[6.0]
  def change
  	create_join_table :entries, :links do |t|
  		t.index :entry_id
  		t.index :user_id
  	end
  end
end
