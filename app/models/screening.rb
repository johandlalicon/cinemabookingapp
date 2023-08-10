class Screening < ApplicationRecord
  belongs_to :movie
  belongs_to :cinema
  belongs_to :timeslot
  has_many :bookings
  has_many :seatings

  validates :movie_id, presence: true
  validates :cinema_id, presence: true
  validates :timeslot_id, presence: true


  def generate_seatings(screening)
    ('A'..'J').each do |alpha|
      (1..10).each do |num|
        break if screening.seatings.count >= 10  
        seat_number = "#{alpha}#{num}"
        seating = screening.seatings.create(seat_number: seat_number, booked: false)
      end
    end
  end

  def available_seatings
    seatings.where(booked: false)
  end

  def available_seatings_count
    available_seatings.count
  end

  def booked_seats_count
    seatings.where(booked: true).count
  end

  def fully_booked?
    bookings.count >= seating_capacity
  end
  
end