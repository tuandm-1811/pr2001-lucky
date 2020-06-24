class Product < ApplicationRecord
    has_many :images
    has_many :product_carts
end
