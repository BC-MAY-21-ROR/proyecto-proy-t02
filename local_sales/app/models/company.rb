class Company < ApplicationRecord
 validates :name, :address, :category_id, presence: true

  belongs_to :category
  has_many :providers
  has_many :products
end
