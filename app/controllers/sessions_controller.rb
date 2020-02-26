class SessionsController < ApplicationController
    def index
    end

    def destroy 
        session.delete(:user_id)
        #deletes sessions user id 
        #if you want to delete the whole session use session.clear 
        redirect_to '/'
    end
end
