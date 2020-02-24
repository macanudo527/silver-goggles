class CreateClicks < ActiveRecord::Migration[6.0]
  def change
    create_table :clicks do |t|
      t.integer :link_id
      t.integer :user_id
      t.integer :clicks

      t.timestamps
    end
  end
end
