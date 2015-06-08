require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many :social_profiles }
    it { should have_many :images }
    it { should have_many :links }
  end
end
