FactoryBot.define do
	factory :product do
		name { Faker::Commerce.product_name }
		price { Faker::Number.number(10) }
		image { Faker::Internet.url }
	end
end