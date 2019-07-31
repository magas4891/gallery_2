class Category < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :follows, dependent: :destroy
end
