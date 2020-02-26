class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_movies, through: :reviews, source: :movie
    has_many :movies #that they have created
    validates :username, uniqueness: true, presence: true
    has_secure_password 
    #dont need validations for password because it is already built in with has secure password

end
