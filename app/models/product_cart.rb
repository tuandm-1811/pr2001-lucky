class ProductCart < ApplicationRecord
    belongs_to :products
    has_one :carts
end
