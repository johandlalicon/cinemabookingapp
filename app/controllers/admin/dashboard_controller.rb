class Admin::DashboardController < ApplicationController
    before_action :authenticate_admin!

    def index
        @malls = Mall.all
        @cinema_count = Cinema.count
        @booking_count = Booking.count
        @mall_count = Mall.count
        @screening_count = Screening.count
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
