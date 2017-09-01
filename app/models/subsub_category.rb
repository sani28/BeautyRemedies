class SubsubCategory < ApplicationRecord
  has_many :products
  has_many :product_reviews
  belongs_to :subcategory
end
