class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :user #creator of it giving us the 
  belongs_to :director
  has_many :reviews
  has_many :users, through: :reviews #people who have reviewed it
end
