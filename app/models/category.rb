class Category < ApplicationRecord

  has_many :books, dependent: :destroy

  validates :name, presence: true #,uniqueness: {scope: :name}
  validates :description, presence: true

  default_scope ->{order("updated_at Desc")}
end
