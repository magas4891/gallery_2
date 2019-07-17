class Image < ApplicationRecord
  belongs_to :gallery
  belongs_to :user
end
