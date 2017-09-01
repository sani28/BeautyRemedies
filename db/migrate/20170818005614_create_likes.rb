class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :product_reviews, foreign_key: true
      t.references :articles, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
