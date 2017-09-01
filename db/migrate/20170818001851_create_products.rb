class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.float :ratings
      t.string :images
      t.string :place_of_purchase

      t.references :product_review, foreign_key: true, index: true

      t.timestamps
    end
  end
end
