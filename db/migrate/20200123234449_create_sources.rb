class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string :title
      t.string :url
      t.text :descrip

      t.timestamps
    end
  end
end
