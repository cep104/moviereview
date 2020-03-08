class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :title, presence: true
  validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_t: 10}, presence: true

  validates :movie_id, uniqueness: { scope: :user_id, message: "has already been reviewed"} 
end
