class AddMassageIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :massage_id, :integer
  end
end
