class Timeslot < ApplicationRecord
  attribute :start_time, :string
  has_many :screenings
  has_many :movies, through: :screenings
  has_many :cinemas, through: :screenings
end
