
class Admin::ScreeningsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin


    def index
      @screenings = Screening.all
    end

    def new
      @screening = Screening.new
      @timeslots = Timeslot.all
      @mall = Mall.find(params[:mall_id]) if params[:mall_id]
      @cinemas = @mall ? @mall.cinemas : []
      @movies = @mall.movies
    end
  
    def create
      @screening = Screening.new(screening_params)
      @screening.seating_capacity = 10
      if @screening.save
        @screening.generate_seatings
        redirect_to admin_screening_path(@screening), notice: "Screening was successfully created."
      else
        @movies = Movie.all
        @cinemas = Cinema.all
        @timeslots = Timeslot.all
        render :new
      end
    end

    def show
      @screening = Screening.find(params[:id])
      @booked_users_by_seat = @screening.bookings.group_by { |booking| booking.seating.seat_number }
    end

    def destroy
      @screening = Screening.find(params[:id])
      @mall = @screening.cinema.mall # Get the mall associated with the screening
      if @screening.destroy
        redirect_to admin_mall_path(@mall), notice: "Screening was successfully deleted."
      else
        flash[:alert] = "Unable to delete the screening."
        redirect_to admin_screening_path(@screening)
      end
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

    def require_admin
      unless current_user && current_user.isAdmin?
        flash[:alert] = "You must be an admin to access this page."
        redirect_to root_path
      end
    end

  end
  