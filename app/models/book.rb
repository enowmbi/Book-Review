class Book < ApplicationRecord

  belongs_to :user, dependent: :destroy
  belongs_to :category, dependent: :destroy
  has_many :reviews

  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validate :validate_image

  def thumbnail
    return self.image.variant(resize: "250x250").processed
  end

  def thumbnail_index
    return self.image.variant(resize: "350x250!").processed
  end

  private 
  def validate_image
    if image.attached? == false
      errors.add(:image,'must be attached')
    else
      if !image.content_type.in?(%w(image/jpeg image/png))
        errors.add(:image,'must be JPEG or PNG')
      else
        if image.byte_size > 1200 
          errors.add(:image, 'size should not be greater 1,200 KB ')
        end
      end
    end
  end

end
