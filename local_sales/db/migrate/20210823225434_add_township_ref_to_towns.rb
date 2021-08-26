class AddTownshipRefToTowns < ActiveRecord::Migration[6.1]
  def change
    add_reference :towns, :township, null: false, foreign_key: true
  end
end
