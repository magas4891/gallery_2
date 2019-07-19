class Image < ApplicationRecord
  belongs_to :gallery
  belongs_to :user

  mount_uploader :picture, PictureUploader
end
