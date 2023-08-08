class ChangeDefaultNumberOfCinemasInMalls < ActiveRecord::Migration[7.0]
  def change
    change_column_default :malls, :number_of_cinemas, from: nil, to: 0
  end
end
