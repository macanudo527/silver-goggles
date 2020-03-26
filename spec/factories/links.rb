FactoryBot.define do
  factory :link do
    sequence(:title) { |n| "MyString#{n}" }
    sequence(:url) { |n| "MyString#{n}" }
    descrip { "MyText" }
    image { "MyText" }
    pubdate { Time.now }
    source

    factory :link_with_entries do
    	transient do
    		entries_count {5}
    	end

    	after(:create) do |link, evaluator|
    		create_list(:entry, evaluator.entries_count, links: [link])
    	end
    	
    end


  end
end

