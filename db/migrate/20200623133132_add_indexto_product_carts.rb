class AddIndextoProductCarts < ActiveRecord::Migration[6.0]
  def change
    add_index :product_carts, [:product_id , :cart_id]
    #Ex:- add_index("admin_users", "username")
  end
end
