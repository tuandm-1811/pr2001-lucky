# frozen_string_literal: true

class ProductCart < ApplicationRecord
  belongs_to :product
  has_one :cart
end
