class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :word
      t.string :reading
      t.string :definition
      t.boolean :priority

      t.timestamps
    end
  end
end
