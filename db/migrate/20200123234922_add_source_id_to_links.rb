class AddSourceIdToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :source_id, :integer
  end
end
