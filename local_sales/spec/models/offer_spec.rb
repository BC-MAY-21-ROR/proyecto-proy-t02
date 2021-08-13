require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :status }
    it { should validate_presence_of :discount }
  end
  describe 'relationships' do
    it { should have_and_belong_to_many :products }
  end
end
