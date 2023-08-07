class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :screening

  validate :validate_seating_capacity, on: :create

  private

  def validate_seating_capacity
    puts "Available Seats: #{screening.available_seats}"
    puts "Requested Seats: #{seats.to_i}"
    if screening.fully_booked?
      errors.add(:base, 'Screening is fully booked.')
    elsif seats.to_i > screening.available_seats
      errors.add(:seats, 'Not enough available seats.')
    end
  end
  
end
