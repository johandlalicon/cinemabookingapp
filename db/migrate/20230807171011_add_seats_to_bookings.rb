class AddSeatsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :seats, :integer
  end
end
