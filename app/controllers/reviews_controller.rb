class ReviewsController < ApplicationController
    def new
        if set_movie
       @review = @movie.reviews.build
        else 
            @review = Review.new
        end
   
    end

    def index
        if set_movie
            # if its nested and find an iceream from the nested id
            @reviews = @movie.reviews  
            #start with the parent then go to children movie > parent
        else
            @reviews = Review.all
        end
    end

    def create 
        @review = current_user.reviews.build(review_params)
        if @review.save 
        redirect_to @review
        else  
            render :new 
        end
    end

    def show
         set_review
    end

    private 

    def review_params 
        params.require(:review).permit(:movie_id, :content, :stars, :title)
    end
    def set_movie
        @movie = Movie.find_by_id(params[:movie_id])
    end
    def set_review 
        @review = Review.find_by_id(params[:id])
    end
end
