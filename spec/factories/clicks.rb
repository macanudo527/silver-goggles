FactoryBot.define do
  factory :click do
    link { create(:link) }
    user { create(:user) }
  end
end
