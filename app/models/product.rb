# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :images
  has_many :product_carts
  belongs_to :category
  validates :name_product, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: true
  validates :information, presence: true, length: { maximum: 255 }
end
