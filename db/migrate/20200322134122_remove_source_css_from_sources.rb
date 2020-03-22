class RemoveSourceCssFromSources < ActiveRecord::Migration[6.0]
  def change

    remove_column :sources, :source_css, :string
  end
end
