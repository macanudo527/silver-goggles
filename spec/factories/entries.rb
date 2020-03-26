FactoryBot.define do
  factory :entry do
    sequence(:base_word) { |n| "MyWord#{n}" }
    sequence(:word) { |n| "MyWords#{n}" }
    reading { "MyString" }
    definition { "MyString" }
    priority { false }
  end
end
