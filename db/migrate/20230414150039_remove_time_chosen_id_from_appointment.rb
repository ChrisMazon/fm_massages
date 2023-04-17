class RemoveTimeChosenIdFromAppointment < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :time_chosen_id, :integer
  end
end
