class AddForeignKeyConstraintToCinemas < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :cinemas, :malls
    add_foreign_key :cinemas, :malls, on_delete: :cascade
  end
  def down
    # Remove the foreign key constraint
    remove_foreign_key :cinemas, :malls

    # Add the foreign key constraint without ON DELETE CASCADE (if needed)
    add_foreign_key :cinemas, :malls
  end
end
