class ReviewsController < ApplicationController
    def new
       @movie = Movie.find_by_id(params[:movie_id])
       @review = @movie.reviews.build
    end

    def index
    end

    # private 
    # def set_movie
    #     Movie.find_by_id(params[:movie_id])
    # end
end
