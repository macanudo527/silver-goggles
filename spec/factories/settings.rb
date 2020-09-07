FactoryBot.define do
  factory :setting do
    description { "MyString" }
    constrained { false }
    data_type { "MyString" }
    min_value { 1 }
    max_value { 1 }
  end
end
