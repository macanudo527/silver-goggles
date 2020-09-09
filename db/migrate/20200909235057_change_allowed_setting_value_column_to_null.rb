class ChangeAllowedSettingValueColumnToNull < ActiveRecord::Migration[6.0]
  def change
  	change_column_null :user_settings, :allowed_setting_value_id, true
  end
end
