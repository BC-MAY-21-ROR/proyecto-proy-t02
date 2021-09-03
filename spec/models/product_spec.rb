require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :quantity }
    it { should validate_presence_of :company_id }
  end
  describe 'relationships' do
    it { should belong_to :company }
    it { should have_and_belong_to_many :offers }
  end
end
