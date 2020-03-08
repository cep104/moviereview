module ReviewsHelper
 def display_title
    if params[:movie_id] 
        content_tag(:h1, "Add a Review for #{@review.movie.title}")
    else 
        content_tag(:h1, "Create a review")
 end 
 end
end
