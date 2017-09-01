class ProductSubCategory < ApplicationRecord
  belongs_to :subcategory
  belongs_to :product

end
