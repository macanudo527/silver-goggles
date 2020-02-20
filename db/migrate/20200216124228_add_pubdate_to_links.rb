class AddPubdateToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :pubdate, :datetime
  end
end
