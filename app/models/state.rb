class State < ApplicationRecord
  validates :name, presence: true

  has_many :township
end
