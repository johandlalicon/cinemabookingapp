class BookingsController < ApplicationController
    before_action :set_screening, only: [:new, :create]
    before_action :authenticate_user!

  def new
    @screening = Screening.find(params[:screening_id])
    @booking = Booking.new(screening: @screening, user: current_user)
    @movie_title = @screening.movie.title
    @timeslot_start_time = @screening.timeslot.start_time
    @cinema_number = @screening.cinema.cinema_number
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to user_dashboard_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end
  
  private

  def set_screening
    @screening = Screening.find_by(id: params[:screening_id])
  end

  def booking_params
    params.require(:booking).permit(:screening_id, :user_id, :seats, :seating_id)
  end
end
