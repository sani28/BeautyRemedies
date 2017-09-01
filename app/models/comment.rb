class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :product_review

  has_many :votes, dependent: :nullify
end
