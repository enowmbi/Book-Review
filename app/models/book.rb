class Book < ApplicationRecord

  belongs_to :user,counter_cache: true
  belongs_to :category,counter_cache: true
  has_many :reviews, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validate :validate_image

  def thumbnail
    return self.image.variant(resize: "450x400").processed
  end

  def thumbnail_index
    return self.image.variant(resize: "350x250!").processed
  end

  default_scope ->{ order("Updated_at DESC")}

  private 
  def validate_image
    if image.attached? == false
      errors.add(:image,'must be attached')
    else
      if !image.content_type.in?(%w(image/jpeg image/png))
        errors.add(:image,'must be JPEG or PNG')
      else
        if image.byte_size/1024 > 1200 
          errors.add(:image, 'size should not be greater 1,200 KB ')
        end
      end
    end
  end

  def allow_user_review?(user)
    return true if Review.where(book_id: self.id, user_id: user.id ).blank?
  end

  def average_rating
    reviews = self.reviews
    if reviews.blank?
      return 0
    else
      return reviews.average(:rating).round(2)
    end
  end

end
