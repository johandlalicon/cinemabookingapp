
class Admin::ScreeningsController < ApplicationController
    def index
      @screenings = Screening.all
    end

    def new
      @screening = Screening.new
      @movies = Movie.all
      @cinemas = Cinema.all
      @timeslots = Timeslot.all
    end
  
    def create
      @screening = Screening.new(screening_params)
      @screening.seating_capacity = 10
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

      if existing_screenings.present?
        taken_timeslot_ids = existing_screenings.pluck(:timeslot_id)
        all_timeslot_ids = Timeslot.pluck(:id)
        available_timeslot_ids = all_timeslot_ids - taken_timeslot_ids
        available_timeslots = Timeslot.where(id: available_timeslot_ids)
        @available_timeslot = available_timeslots.pluck(:start_time)
        
        respond_to do |timeslot|
          timeslot.turbo_stream
        end

      else
        @all_timeslot = Timeslot.pluck(:start_time)

        respond_to do |timeslot|
          timeslot.turbo_stream
        end

      end
    end

    private

    def screening_params
      start_time = params[:screening].delete(:timeslot_id)
      timeslot = Timeslot.find_by(start_time: start_time)
      params.require(:screening).permit(:movie_id, :cinema_id).merge(timeslot_id: timeslot.id)
    end

  end
  