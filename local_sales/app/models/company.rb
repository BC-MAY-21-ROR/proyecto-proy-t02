class Company < ApplicationRecord
    validates :name, :adress, presence: true

    belongs_to :category
    has_many :providers
    has_many :products
end
