class Town < ApplicationRecord
  validates :name, :township_id, presence: true
  
  has_many :companies
  belongs_to :township
end
