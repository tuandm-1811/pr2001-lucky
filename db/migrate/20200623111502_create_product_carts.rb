class CreateProductCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :product_carts do |t|
      t.integer :quantity
      t.integer :total_product
      t.references :product, null: false ,foreign_key: true
      t.references :cart, null: false ,foreign_key: true
    end
  end
end
