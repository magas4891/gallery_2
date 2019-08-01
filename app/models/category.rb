class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }

  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :follows, dependent: :destroy
end
