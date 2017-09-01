class AddSubCategoriesToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :subcategories, :category_id, :integer
    remove_column :subcategories, :skincare_category
    rename_column :subcategories, :makeup_category, :name

    add_column :subsub_categories, :subcategory_id, :integer
    remove_column :subsub_categories, :makeup_sscateg
    rename_column :subsub_categories, :skincare_sscateg, :name
  end
end
