class Screening < ApplicationRecord
  belongs_to :movie
  belongs_to :cinema
  belongs_to :timeslot
end
