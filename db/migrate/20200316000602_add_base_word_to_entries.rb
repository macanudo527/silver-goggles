class AddBaseWordToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :base_word, :string
    change_column :entries, :definition, :text
  end
end
