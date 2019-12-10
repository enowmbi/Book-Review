class Category < ApplicationRecord

  validates :name, presence: true #,uniqueness: {scope: :name}
  validates :description, presence: true
end
