class Review < ApplicationRecord
  belongs_to :book,counter_cache: true
  belongs_to :user,counter_cache: true

  validates :rating, presence: true, numericality: {only_integers: true,greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :comment, presence: true

  validates :user_id, uniqueness: {scope: :book_id, message: "You are entitled to only one review for each book"}

  default_scope ->{order(updated_at: :desc)}
  
end
