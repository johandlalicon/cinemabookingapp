class Admin::DashboardController < ApplicationController
    before_action :authenticate_admin!

    def index
    end

    def new
        @movie = Movie.new
    end

    def create
    end

    

    def authenticate_admin!
        redirect_to root_path unless current_user&.isAdmin?
    end

end
