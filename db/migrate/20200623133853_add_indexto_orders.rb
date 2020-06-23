class AddIndextoOrders < ActiveRecord::Migration[6.0]
  def change
    add_index :orders, [:user_id , :cart_id]
    #Ex:- add_index("admin_users", "username")
  end
end
