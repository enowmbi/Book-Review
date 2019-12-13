class Book < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true

  def thumbnail
    return self.image.variant(resize: "250x250").processed
  end

  def thumbnail_index
     return self.image.variant(resize: "350x250").processed
  end
end
