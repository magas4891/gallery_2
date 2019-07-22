class Image < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :likes

  mount_uploader :picture, PictureUploader
end
