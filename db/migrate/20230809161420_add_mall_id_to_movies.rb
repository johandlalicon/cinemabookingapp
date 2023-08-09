class AddMallIdToMovies < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :mall, null: false, foreign_key: true
  end
end
