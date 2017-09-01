class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  acts_as_taggable
  acts_as_taggable_on :skin_type, :skin_base_tone, :eyebrow_shape, :face_shape, :eye_shape

  has_secure_password

  has_many :product_reviews, dependent: :nullify
  has_many :articles, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :votes, dependent: :nullify

end
