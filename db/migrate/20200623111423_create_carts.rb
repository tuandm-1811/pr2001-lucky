# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :sumcart
      t.references :users
      t.timestamps
    end
  end
end
