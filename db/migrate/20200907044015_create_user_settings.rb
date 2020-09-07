class CreateUserSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :user_settings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :setting, null: false, foreign_key: true
      t.references :allowed_setting_value, null: false, foreign_key: true
      t.string :unconstrained_value

      t.timestamps
    end
  end
end
