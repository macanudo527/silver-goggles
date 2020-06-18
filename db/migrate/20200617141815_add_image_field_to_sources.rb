class AddImageFieldToSources < ActiveRecord::Migration[6.0]
  def change
    add_column :sources, :image, :string  	
  end
end
