class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.text :descrip
      t.text :image

      t.timestamps
    end
  end
end
