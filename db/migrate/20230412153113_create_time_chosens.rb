class CreateTimeChosens < ActiveRecord::Migration[6.0]
  def change
    create_table :time_chosens do |t|
      t.time :time
      t.integer :user_id

      t.timestamps
    end
  end
end
