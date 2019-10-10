require 'rails_helper'

RSpec.describe Product, type: :model do
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(255) }

  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price).only_integer }
  it { should validate_numericality_of(:price).is_greater_than(0) }

  # it { is_expected.to validate_url_of(:image) }
end