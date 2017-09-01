class Like < ApplicationRecord
  belongs_to :product_review
  belongs_to :article
  belongs_to :user
end
