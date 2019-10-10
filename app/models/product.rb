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

class Product < ApplicationRecord; end
