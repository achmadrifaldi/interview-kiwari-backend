# == Schema Information
#
# Table name: app_options
#
#  id           :integer          not null, primary key
#  option_name  :string
#  option_value :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
	factory :app_option do
		option_name { Faker::Commerce.product_name }
		option_value { Faker::Number.number(10) }
	end
end
