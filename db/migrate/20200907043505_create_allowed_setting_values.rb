class CreateAllowedSettingValues < ActiveRecord::Migration[6.0]
  def change
    create_table :allowed_setting_values do |t|
      t.references :setting, null: false, foreign_key: true
      t.string :item_value
      t.string :caption

      t.timestamps
    end
  end
end
