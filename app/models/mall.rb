class Mall < ApplicationRecord
    has_many :cinemas, dependent: :destroy
    validates :name, presence: true, uniqueness: true
    validates :location, presence: true
    validates :number_of_cinemas, presence: true, numericality: { greater_than: 0 }

    def total_screenings_count
        cinemas.joins(screenings: :timeslot).count
    end
end
