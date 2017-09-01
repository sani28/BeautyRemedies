class CreateProductReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :product_reviews do |t|
      t.text :positive_comment
      t.text :negative_comment


      t.references :users, foreign_key: true, index: true
      t.references :categories, foreign_key: true
      t.references :subcategories, foreign_key: true
      t.references :subsub_categories, foreign_key: true

      t.timestamps
    end
  end
end
