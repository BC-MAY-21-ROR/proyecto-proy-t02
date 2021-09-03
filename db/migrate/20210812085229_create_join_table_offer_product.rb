class CreateJoinTableOfferProduct < ActiveRecord::Migration[6.1]
  def change
    create_join_table :offers, :products do |t|
      # t.index [:offer_id, :product_id]
      # t.index [:product_id, :offer_id]
    end
  end
end
