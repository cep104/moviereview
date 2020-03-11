class MoviesController < ApplicationController
    # before_action :set_movie, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in
    def new 
        @movie = Movie.new
        @movie.build_genre
        @movie.build_director
        #wont need it in edit so putting it in new instead of form
    end

    def show 
        @movie = Movie.find(params[:id])
    end

    def create 
    @movie = Movie.new(movie_params)
        @movie.user_id = session[:user_id] 
        if @movie.save
            @movie.image.purge 
            @movie.image.attach(params[:movie][:image]) #this is where validations happen
            redirect_to @movie
        else
            @movie.build_genre 
            @movie.build_director
            render :new
        end
    end

    def edit
        @movie = Movie.find(params[:id])
    end
  
    def update
        @movie = Movie.find(params[:id])
      if @movie.update(movie_params)
        @movie.image.purge
        @movie.image.attach(params[:movie][:image])
        redirect_to movie_path(@movie)
      else
        render :edit
      end
    end

    def index 
        @movies = Movie.order_by_rating.includes(:genre, :director)
    end

   

    private 
    def movie_params 
        params.require(:movie).permit(:title, :description, :genre_id, :director_id, :image, genre_attributes:[:name], director_attributes: [:name] )
    end

    def set_movie
        @movie = movie.find_by(params[:id])
        redirect_movie_path if !@movie
     end
end

#scope methods are class level methods that change the scope of a collection, instead of looking at all the movies 
#were looking at the movies that have a review 

#model methods are instance methods, methods that are querieying the database

#helper methods are usually dealing with things that you use in the view, need an argument