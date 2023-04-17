class AddMassageIdToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :massage_id, :integer
  end
end
