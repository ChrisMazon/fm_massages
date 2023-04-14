class DropTimeChosenTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :time_chosens
  end
end
