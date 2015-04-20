class StaticPagesController < ApplicationController
    layout "logged_in", :except => [:home]
    
    def home
    end
    
    def logged_in
        @pid = params[:id]
    end
end
