class Offer < ApplicationRecord
  validates :name, :status, :discount, presence: true

  has_and_belongs_to_many :products
end
