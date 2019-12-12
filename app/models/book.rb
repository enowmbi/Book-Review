class Book < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true

  has_one_attached :image


  def thumbnail
    return self.image.variant(resize: "250x250").processed
  end

  def thumbnail_index
     return self.image.variant(resize: "350x250").processed
  end
end
