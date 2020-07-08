# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.references :user, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
    end
  end
end
