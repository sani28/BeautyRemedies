class Subcategory < ApplicationRecord
  has_many :products
  has_many :product_reviews
  belongs_to :category
  has_many :subsub_categories

end
