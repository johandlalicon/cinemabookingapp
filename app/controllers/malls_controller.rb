class MallsController < ApplicationController
    def index
        @screenings = Screening.includes(:movie, :timeslot, cinema: :mall)
        @grouped_screenings = @screenings.group_by { |screening| screening.cinema.mall }
        
    end
    def show
        
    end
end
