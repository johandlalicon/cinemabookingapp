class Timeslot < ApplicationRecord
  has_many :screenings
  has_many :movies, through: :screenings
  has_many :cinemas, through: :screenings
end
