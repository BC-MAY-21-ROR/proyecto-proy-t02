class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.string :name
      t.integer :status
      t.float :discount

      t.timestamps
    end
  end
end
