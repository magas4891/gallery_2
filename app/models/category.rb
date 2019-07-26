class Category < ApplicationRecord
  belongs_to :user
  has_many :images

  extend FriendlyId
  friendly_id :name, use: :slugged
end
