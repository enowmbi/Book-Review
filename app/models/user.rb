class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true


  def thumbnail
    return self.image.variant(resize: '150x150').processed
  end

  def medium
    return self.image.variant(resize: '250x250').processed
  end

  def full_name
    return self.first_name + ' ' + self.last_name
  end

  def validate_photo
    if self.photo.attached? == false
      self.errors.add(:photo,'must be present')
    else
      if !self.photo.content_type.in?(%w(image/jpeg image/png))
        errors.add(:photo,'must be either jpg or png')
      else
        if self.photo.byte_size/1024 > 1200 
          errors.add(:photo,'size must not be greater than 1200KB')
        end
      end
    end

  end

end
