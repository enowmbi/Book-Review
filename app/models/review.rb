class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :rating, presence: true, numericality: {only_integers: true,greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :comment, presence: true

  default_scope {order(updated_at: :desc)}
  
end
