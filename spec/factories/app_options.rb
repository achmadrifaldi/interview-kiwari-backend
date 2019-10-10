FactoryBot.define do
	factory :app_option do
		option_name { Faker::Commerce.product_name }
		option_value { Faker::Number.number(10) }
	end
end