class MoviesController < ApplicationController
    def index
        @movies = Movie.all.includes(:screenings)
    end

    def show
        @movie = Movie.find(params[:id])
        @screenings = @movie.screenings.includes(:timeslot, :cinema)
    end
end
