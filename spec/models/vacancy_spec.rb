require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Vacancy, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:partnerId) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:categoryId) }
  it { should validate_presence_of(:expiresAt) }
end