class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :screening
  belongs_to :seating
  before_create :mark_seating_as_booked

  private

  def mark_seating_as_booked
    seating.update(booked: true)
  end
  
end
