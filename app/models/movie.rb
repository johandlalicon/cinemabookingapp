class Movie < ApplicationRecord
    has_many :screenings
    has_many :cinemas, through: :screenings
    has_many :timeslots, through: :screenings
end
