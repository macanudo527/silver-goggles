FactoryBot.define do
  factory :study_record do
    user
    entry
    mastery { 1 }
  end
end
