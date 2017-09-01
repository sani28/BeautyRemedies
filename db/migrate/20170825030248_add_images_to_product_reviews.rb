class AddImagesToProductReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :product_reviews, :images, :string
  end
end
