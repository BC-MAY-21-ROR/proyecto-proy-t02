class Offer < ApplicationRecord
    validates :name, :status, :discount, :product_id, presence: true

    has_and_belongs_to_many :products
end
