class AddColumnRatetoProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :rate, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
