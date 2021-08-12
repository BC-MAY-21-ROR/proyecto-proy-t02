require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :category_id }
  end
  describe 'relationships' do
    it { should belong_to :category }
    it { should have_many :providers }
    it { should have_many :products }
  end
end
