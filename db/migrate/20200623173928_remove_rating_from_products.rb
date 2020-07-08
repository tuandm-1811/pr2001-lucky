# frozen_string_literal: true

class RemoveRatingFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :rating
  end
end
