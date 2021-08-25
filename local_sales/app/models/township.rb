class Township < ApplicationRecord
  validates :name, :state_id, presence: true

  has_many :towns
  belongs_to :state
end
