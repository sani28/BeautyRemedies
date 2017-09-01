class CreateSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :subcategories do |t|
      t.string :makeup_category
      t.string :skincare_category

      t.timestamps
    end
  end
end
