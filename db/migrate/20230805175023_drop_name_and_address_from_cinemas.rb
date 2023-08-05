class DropNameAndAddressFromCinemas < ActiveRecord::Migration[7.0]
  def change
    remove_column :cinemas, :name, :string
    remove_column :cinemas, :address, :string
  end
end
