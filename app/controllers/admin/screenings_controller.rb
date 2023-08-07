
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

    def timeslots
      @target = params[:target]
      cinema = params[:cinema]
      existing_screenings = Screening.where(cinema_id: cinema)
      
      taken_timeslots = existing_screenings.pluck(:timeslot_id)
      
      all_timeslots = Timeslot.all.pluck(:id)
      
      available_timeslots = all_timeslots.select { |timeslot| !taken_timeslots.include?(timeslot.id) }
      @available_timeslot_start_times = available_timeslots.pluck(:start_time)

      respond_to do |timeslot|
        timeslot.turbo_stream
      end
      
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

  end
  