class Cinema < ApplicationRecord
  validates :cinema_number, presence: true, uniqueness: true, inclusion: { in: 1..4 }
  has_many :screenings
  has_many :movies, through: :screenings

end
