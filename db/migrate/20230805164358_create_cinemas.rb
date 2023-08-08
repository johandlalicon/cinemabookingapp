class CreateCinemas < ActiveRecord::Migration[7.0]
  def change
    create_table :cinemas do |t|
      t.string :name
      t.string :address
      t.references :mall, foreign_key: true, on_delete: :cascade
      t.timestamps
    end
  end
end
