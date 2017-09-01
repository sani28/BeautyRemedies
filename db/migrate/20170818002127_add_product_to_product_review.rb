class AddProductToProductReview < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_reviews, :product, foreign_key: true, index: true
  end
end
