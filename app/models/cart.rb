class Cart < ApplicationRecord
    has_one :orders
    belongs_to :product_carts
end
