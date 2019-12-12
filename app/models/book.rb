class Book < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true

  has_one_attached :image
end
