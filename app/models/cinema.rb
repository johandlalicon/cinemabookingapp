class Cinema < ApplicationRecord
  validates :cinema_number, presence: true
  has_many :screenings
  has_many :movies, through: :screenings
  belongs_to :mall

end
