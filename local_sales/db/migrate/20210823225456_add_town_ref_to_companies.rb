class AddTownRefToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_reference :companies, :town, null: false, foreign_key: true
  end
end
