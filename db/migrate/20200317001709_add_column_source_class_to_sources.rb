class AddColumnSourceClassToSources < ActiveRecord::Migration[6.0]
  def change
  	add_column :sources, :source_css, :text
  end
end
