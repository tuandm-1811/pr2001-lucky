class Product < ApplicationRecord
    has_many :images
    has_many :product_carts
    belongs_to :categories
end
