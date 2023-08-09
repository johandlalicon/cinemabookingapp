class CreateSeatings < ActiveRecord::Migration[7.0]
  def change
    create_table :seatings do |t|
      t.references :screening, null: false, foreign_key: true
      t.integer :seat_number
      t.boolean :booked

      t.timestamps
    end
  end
end
