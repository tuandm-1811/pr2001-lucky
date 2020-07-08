class ProductCart < ApplicationRecord
    belongs_to :product
    has_one :cart
end
