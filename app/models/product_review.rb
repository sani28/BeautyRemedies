class ProductReview < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :product, optional: true

  has_many :likes, dependent: :nullify
  has_many :comments, dependent: :nullify

  delegate :category, to: :product, allow_nil: true
  delegate :subcategory, to: :product, allow_nil: true

  def product
    super || (
      p = Product.new
      p.product_reviews << self
      return p
    )
  end




end
