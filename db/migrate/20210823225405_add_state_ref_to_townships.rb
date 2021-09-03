class AddStateRefToTownships < ActiveRecord::Migration[6.1]
  def change
    add_reference :townships, :state, null: false, foreign_key: true
  end
end
