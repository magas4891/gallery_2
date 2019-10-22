# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1 }

  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :follows, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged
end
