class AddTimeChosenToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :time_chosen, :time
  end
end
