class AddSeatingCapacityToScreenings < ActiveRecord::Migration[7.0]
  def change
    change_column :screenings, :seating_capacity, :integer, default: 10
  end
end
