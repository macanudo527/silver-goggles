FactoryBot.define do
  factory :user_setting do
    user_id { nil }
    setting_id { nil }
    allowed_setting_value_id { nil }
    unconstrained_value { "MyString" }
  end
end
