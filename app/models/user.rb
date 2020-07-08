# frozen_string_literal: true

class User < ApplicationRecord
  has_many :orders
  has_many :ratings
  has_secure_password
end
