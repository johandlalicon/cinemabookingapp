class MoviesController < ApplicationController
    
    def index
        @screenings = Screening.all
    end

    def show
        @movie = Movie.find(params[:id])
        @screenings = @movie.screenings.includes(:timeslot, :cinema)
    end
end
