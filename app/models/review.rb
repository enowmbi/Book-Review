class Review < ApplicationRecord
  belongs_to :book,counter_cache: true
  belongs_to :user,counter_cache: true

  validates :comment, presence: true

  validates :user_id, uniqueness: {scope: :book_id, message: "You are entitled to only one review for each book"}

  default_scope ->{order(updated_at: :desc)}
  
end
