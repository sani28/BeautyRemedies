class Category < ApplicationRecord
  has_many :products
  has_many :product_reviews

  has_many :subcategories

end
