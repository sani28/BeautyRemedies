class AddRatingToProductReview < ActiveRecord::Migration[5.1]
  def change
    add_column :product_reviews, :rating, :integer
  end
end
