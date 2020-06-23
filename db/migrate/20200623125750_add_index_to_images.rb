class AddIndexToImages < ActiveRecord::Migration[6.0]
  def change
    add_index :images, :product_id
    #Ex:- add_index("admin_users", "username")
  end
end
