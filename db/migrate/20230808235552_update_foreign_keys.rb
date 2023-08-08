class UpdateForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :cinemas, :malls
    add_foreign_key :cinemas, :malls, on_delete: :cascade
    
    remove_foreign_key :screenings, :cinemas
    add_foreign_key :screenings, :cinemas, on_delete: :cascade
  end
end
