class AddCategoryRefToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_reference :companies, :category, null: false, foreign_key: true
  end
end
