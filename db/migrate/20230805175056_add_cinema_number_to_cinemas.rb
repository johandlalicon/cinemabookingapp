class AddCinemaNumberToCinemas < ActiveRecord::Migration[7.0]
  def change
    add_column :cinemas, :cinema_number, :integer, null: false, unique: true
  end
end
