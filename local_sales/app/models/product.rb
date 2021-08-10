class Product < ApplicationRecord
    validates :name, :price, :quantity, :company_id, :offer_id, presence: true

    belongs_to :company
    has_many :offers
end
