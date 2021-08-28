class AddPhoneToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :phone, :integer
  end
end
