
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
        redirect_to admin_screening_path(@screening), notice: "Screening was successfully created."
      else
        @movies = Movie.all
        @cinemas = Cinema.all
        @timeslots = Timeslot.all
        render :new
      end
    end

    def show
      @screening = Screening.last
    end
  
    private
  
    def screening_params
      params.require(:screening).permit(:movie_id, :cinema_id, :start_time, :timeslot_id)
    end

    def check_existing_timeslot()
      existing_screening = Screening.find_by(cinema_id: cinema_id, timeslot_id: timeslot_id)
      if existing_screening
        taken_timeslot = existing_screening.timeslot.id
      end
    end

    def unique_cinema_timeslot_combination
      existing_screening = Screening.find_by(cinema_id: cinema_id, timeslot_id: timeslot_id)
      if existing_screening && existing_screening != self
        errors.add(:base, "Another screening with the same cinema and timeslot already exists")
      end
    end

  end
  