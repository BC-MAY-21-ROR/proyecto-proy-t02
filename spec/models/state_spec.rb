require 'rails_helper'

RSpec.describe State, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should have_many :township }
  end
end
