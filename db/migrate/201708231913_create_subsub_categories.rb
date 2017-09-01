class CreateSubsubCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :subsub_categories do |t|
      t.string :makeup_sscateg
      t.string :skincare_sscateg

      t.timestamps
    end
  end
end
