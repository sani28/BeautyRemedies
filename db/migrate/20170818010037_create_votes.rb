class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.boolean :is_up
      t.references :users, foreign_key: true
      t.references :comments, foreign_key: true
      t.references :product_reviews, foreign_key: true

      t.timestamps
    end
  end
end
