class Movie < ApplicationRecord
    
    belongs_to :mall, optional: true
    has_many :screenings
    has_many :cinemas, through: :screenings

end
