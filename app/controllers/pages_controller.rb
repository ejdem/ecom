class PagesController < ApplicationController
    def home
        if user_signed_in?
            redirect_to '/items'
        end
    end
end
