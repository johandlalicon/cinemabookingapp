class ChangeSeatNumberDataTypeInSeatings < ActiveRecord::Migration[7.0]
  def up
    change_column :seatings, :seat_number, :string
  end

  def down
    change_column :seatings, :seat_number, :integer
  end
end