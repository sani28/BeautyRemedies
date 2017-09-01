class Product < ApplicationRecord
  mount_uploaders :images, ImagesUploader
  serialize :avatars, JSON


  has_many :product_reviews
  has_many :articles#, dependent: :nullify

  has_one :product_category
  has_one :category, through: :product_category

  has_one :product_sub_category
  has_one :subcategory, through: :product_sub_category


  def average_rating
    ratings = product_reviews.pluck(:rating).compact
    ratings.sum / ratings.length
  end

end
