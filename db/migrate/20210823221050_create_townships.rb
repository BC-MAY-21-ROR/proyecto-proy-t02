class CreateTownships < ActiveRecord::Migration[6.1]
  def change
    create_table :townships do |t|
      t.string :name

      t.timestamps
    end
  end
end
