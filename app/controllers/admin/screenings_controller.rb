
class Admin::ScreeningsController < ApplicationController
    def new
      @screening = Screening.new
      @movies = Movie.all
      @cinemas = Cinema.all
      @timeslots = Timeslot.all
    end
  
    def create
      @screening = Screening.new(screening_params)
      if @screening.save
        redirect_to admin_movies_path, notice: "Screening was successfully created."
      else
        @movies = Movie.all
        @cinemas = Cinema.all
        @timeslots = Timeslot.all
        render :new
      end
    end
  
    private
  
    def screening_params
      params.require(:screening).permit(:movie_id, :cinema_id, :start_time)
    end
  end
  