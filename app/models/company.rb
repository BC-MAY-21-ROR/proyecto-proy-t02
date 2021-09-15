class Company < ApplicationRecord
 validates :name, :address, :phone, :category_id, :town_id, :user_id, presence: true

  belongs_to :user
  belongs_to :category
  belongs_to :town
  has_many :providers
  has_many :products
  has_one_attached :company_img

  def sum_products()
    products.sum(:quantity)
  end

end
