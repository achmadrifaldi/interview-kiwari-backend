# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :integer
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
	factory :product do
		name { Faker::Commerce.product_name }
		price { Faker::Number.number(10) }
		image { Faker::Internet.url }
	end
end
