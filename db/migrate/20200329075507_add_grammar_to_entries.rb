class AddGrammarToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :grammar, :boolean
  end
end
