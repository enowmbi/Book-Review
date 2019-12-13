class Category < ApplicationRecord

  has_many :books

  validates :name, presence: true #,uniqueness: {scope: :name}
  validates :description, presence: true
end
