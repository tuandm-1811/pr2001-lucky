class CreateProductCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :product_carts do |t|
      t.integer :quantity
      t.integer :total_product
    end
  end
end
