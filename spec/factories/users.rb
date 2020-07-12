FactoryBot.define do
  factory :user do
	sequence(:email) { |n| "user#{n}@example.com"}
	password { 'password' }
	password_confirmation { 'password' }
	confirmed_at { Time.now } 
	user_role { true } 
	editor_role { false }
	admin_role { false }
	factory :editor do
		editor_role { true }
	end  
  end
end
