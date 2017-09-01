class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :product_review



end
