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

require 'rails_helper'

RSpec.describe AppOption, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
