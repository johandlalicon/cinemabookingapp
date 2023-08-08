class AddNumberOfCinemasToMalls < ActiveRecord::Migration[7.0]
  def change
    add_column :malls, :number_of_cinemas, :integer
  end
end
