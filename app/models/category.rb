class Category < ApplicationRecord
    has_many :products, dependent: :destroy
    validates :name_category, presence: true
end
