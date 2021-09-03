require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :company_id }
  end
  describe 'relationships' do
    it { should belong_to :company }
  end
end
