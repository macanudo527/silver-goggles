FactoryBot.define do
  factory :entry do
    sequence(:base_word) { |n| "MyWord#{n}" }
    sequence(:word) { |n| "MyWords#{n}" }
    reading { "MyReading" }
    definition { "MyDefinition" }
    priority { false }
    grammar { false }
    factory :priority_entry do
     	sequence(:base_word) { |n| "MyPriorityWord#{n}" }
    	priority { true }
    end
    factory :grammar_entry do
     	sequence(:base_word) { |n| "MyGrammarWord#{n}" }
    	grammar { true }
    end
  end
end
