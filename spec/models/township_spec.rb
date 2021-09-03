require 'rails_helper'

RSpec.describe Township, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :state_id }
  end
  describe 'relationships' do
    it { should belong_to :state }
    it { should have_many :towns }
  end
end
