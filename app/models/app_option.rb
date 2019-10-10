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

class AppOption < ApplicationRecord
  validates :option_name, uniqueness: true

  def self.to_map
    options = {}

    all.each do |app_option|
      options[app_option.option_name] = app_option.option_value
    end

    return options
  end
end
