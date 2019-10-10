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
  it { should validate_uniqueness_of(:option_name) }
end
