class Seating < ApplicationRecord
  belongs_to :screening
  before_create :generate_seat_number

  def generate_seat_number
    self.seat_number = next_available_seat_number
  end

  def next_available_seat_number
    used_seat_numbers = screening.seatings.pluck(:seat_number)
    available_seat_numbers = (1..screening.seating_capacity).to_a - used_seat_numbers
    available_seat_numbers.first
  end
  
end
