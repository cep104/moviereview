class MoviesController < ApplicationController
    def new 
        @movie = Movie.new
        @movie.build_genre
        @movie.build_director
        #wont need it in edit so putting it in new instead of form
    end

    def create 
    @movie = Movie.new(movie_params)
        @movie.user_id = session[:user_id] 
        if @movie.save #this is where validations happen
            redirect_to @movie
        else
            render :new
        end
    end

    def index 
        @movies = Movie.order_by_rating.includes(:genre, :director)
    end

    private 
    def movie_params 
        params.require(:movie).permit(:title, :description, :genre_id, :director_id, genre_attributes:[:name], director_attributes: [:name] )
    end
end
