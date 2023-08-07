class Screening < ApplicationRecord
  belongs_to :movie
  belongs_to :cinema
  belongs_to :timeslot
  has_many :bookings

  def available_seats
    booked_seats = bookings.sum(:seats)
    available = seating_capacity - booked_seats
    available
  end

  def fully_booked?
    bookings.count >= seating_capacity
  end
  
end
