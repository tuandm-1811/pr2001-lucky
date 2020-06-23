class AddIndextoCarts < ActiveRecord::Migration[6.0]
  def change
    add_index :carts, [:product_id , :productcart_id]
    #Ex:- add_index("admin_users", "username")
  end
end
