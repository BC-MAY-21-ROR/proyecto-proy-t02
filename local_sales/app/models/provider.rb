class Provider < ApplicationRecord
  validates :name, :company_id, presence: true

  belongs_to :company
end
