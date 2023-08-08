class AddMallToCinemas < ActiveRecord::Migration[7.0]
  def change
    add_reference :cinemas, :mall, null: true, foreign_key: true
  end
end
