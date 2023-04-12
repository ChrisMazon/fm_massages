class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :time_chosen_id
      t.integer :user_id
      t.string :massage_type
      t.string :price

      t.timestamps
    end
  end
end
