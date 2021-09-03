require 'rails_helper'

RSpec.describe Town, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :township_id }
  end
  describe 'relationships' do
    it { should belong_to :township }
    it { should have_many :companies }
  end
end
