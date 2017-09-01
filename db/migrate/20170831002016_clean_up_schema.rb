class CleanUpSchema < ActiveRecord::Migration[5.1]

  def change
    remove_column :product_reviews, :categories_id
    remove_column :product_reviews, :subcategories_id
    remove_column :product_reviews, :subsub_categories_id
    remove_column :products, :product_review_id
  end

end
