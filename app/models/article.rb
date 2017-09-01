class Article < ApplicationRecord
  belongs_to :product_review
  belongs_to :user

  has_many :products, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

end
