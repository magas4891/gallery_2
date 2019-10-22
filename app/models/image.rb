class Image < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  mount_uploader :picture, PictureUploader
  validates :title, presence: true
  validates :picture, presence: true,
                      file_size: { less_than: 50.megabytes,
                                   message: 'Image must be not greater then 50 Mb'},
                      file_content_type: { allow: %w[image/jpeg image/png image/jpg],
                                           message: 'The file must be image!' }
end
