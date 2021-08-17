class Product < ApplicationRecord
  validates :name, :price, :quantity, :company_id, presence: true

  belongs_to :company
  has_many :offers_products
  has_many :offers, through: :offers_products
end
