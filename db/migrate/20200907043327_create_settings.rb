class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.string :description
      t.boolean :constrained
      t.string :data_type
      t.string :min_value
      t.string :max_value

      t.timestamps
    end
  end
end
