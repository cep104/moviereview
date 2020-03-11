class GenresController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index 
        @genres = Genre.all 
    end

    def show 
        set_genre
    end

    private 
    def set_genre 
        @genre = Genre.find_by(params[:id])
        redirect_genre_path if !@genre
    end
end
