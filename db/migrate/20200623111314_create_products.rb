# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name_product
      t.text :information
      t.integer :rating
      t.integer :price
      t.string :type
      t.integer :category_id, foreign_key: true
      t.timestamps
    end
  end
end
