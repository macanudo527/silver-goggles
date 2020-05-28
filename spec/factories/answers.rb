FactoryBot.define do
  factory :answer do
    user
    entry
    correct { false }
    factory :correct_answer do
    	correct { true }
    end
    factory :incorrect_answer do
       	correct { false }
    end
  end
end
