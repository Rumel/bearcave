FactoryGirl.define do 
	factory :user do
		name "Test User"
		email "test@example.com"
		password "foobar"
		password_confirmation "foobar"

		factory :admin do
			name "Admin User"
			email "admin@example.com"
			admin true
		end
	end
end