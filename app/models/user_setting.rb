class UserSetting < ApplicationRecord
  belongs_to :user_id
  belongs_to :setting_id
  belongs_to :allowed_setting_value_id
end
