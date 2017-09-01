class CreateProductSubCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_sub_categories do |t|
      t.references :product, foreign_key: true
      t.references :subcategory, foreign_key: true
      t.timestamps
    end
  end
end
