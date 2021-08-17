class Offer < ApplicationRecord
  validates :name, :status, :discount, presence: true

  has_many :offers_products
  has_many :products, through: :offers_products
end
