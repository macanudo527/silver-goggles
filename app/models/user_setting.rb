class UserSetting < ApplicationRecord
  belongs_to :user
  belongs_to :setting
  belongs_to :allowed_setting_value, optional: true
end
