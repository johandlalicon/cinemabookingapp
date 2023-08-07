class UserDashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @cinemas = Cinema.all
    @movies = Movie.all
    @user_bookings = current_user.bookings.includes(:screening)
  end

end
