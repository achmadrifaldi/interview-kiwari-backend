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

class Product < ApplicationRecord
	validates :name, 
		presence: true,
		length: { maximum: 255 }
	
	validates :price, 
		presence: true,
		numericality: {
			only_integer: true,
			greater_than: 0
		}

	validates :image, 
		url: { allow_blank: true }
end
