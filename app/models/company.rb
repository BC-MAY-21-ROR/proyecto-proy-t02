class Company < ApplicationRecord
 validates :name, :address, :phone, :category_id, :town_id, presence: true

  belongs_to :category
  belongs_to :town
  has_many :providers
  has_many :products
end
