class Image < ApplicationRecord
  belongs_to :category
  belongs_to :user

  mount_uploader :picture, PictureUploader
end
