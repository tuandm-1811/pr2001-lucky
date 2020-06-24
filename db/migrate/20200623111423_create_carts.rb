class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :sumcart
      t.references :product, null: false ,foreign_key: true
      t.references :product_carts, null: false ,foreign_key: true
    end
  end
end
