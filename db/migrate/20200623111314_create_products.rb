class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name_product
      t.text :information
      t.integer :rating
      t.integer :price
      t.string :type

      t.timestamps
    end
  end
end
