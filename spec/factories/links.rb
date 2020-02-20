FactoryBot.define do
  factory :link do
    sequence(:title) { |n| "MyString#{n}" }
    sequence(:url) { |n| "MyString#{n}" }
    descrip { "MyText" }
    image { "MyText" }
    pubdate { Time.now }
    source
  end
end

