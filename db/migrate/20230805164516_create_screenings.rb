class CreateScreenings < ActiveRecord::Migration[7.0]
  def change
    create_table :screenings do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :cinema, null: false, foreign_key: { on_delete: :cascade }
      t.references :timeslot, null: false, foreign_key: true
      t.integer :seating_capacity

      t.timestamps
    end
  end
end
