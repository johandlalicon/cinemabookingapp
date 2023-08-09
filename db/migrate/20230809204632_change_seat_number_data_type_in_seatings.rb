class ChangeSeatNumberDataTypeInSeatings < ActiveRecord::Migration[7.0]
  def change
      change_column :seatings, :seat_number, :string
  end
