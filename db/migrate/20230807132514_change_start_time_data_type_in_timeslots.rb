class ChangeStartTimeDataTypeInTimeslots < ActiveRecord::Migration[7.0]
  def change
    def up
      change_column :timeslots, :start_time, :string
    end
  
    def down
      change_column :timeslots, :start_time, :datetime
    end
  end
end
