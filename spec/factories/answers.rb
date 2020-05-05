FactoryBot.define do
  factory :answer do
    user
    entry
    correct { false }
  end
end
