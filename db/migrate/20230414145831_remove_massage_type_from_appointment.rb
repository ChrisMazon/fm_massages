class RemoveMassageTypeFromAppointment < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :massage_type, :string
    remove_column :appointments, :price, :string
  end
end
