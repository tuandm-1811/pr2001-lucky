class Cart < ApplicationRecord
    has_one :order
    belongs_to :product_cart
end
