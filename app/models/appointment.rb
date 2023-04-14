# == Schema Information
#
# Table name: appointments
#
#  id             :integer          not null, primary key
#  date           :datetime
#  massage_type   :string
#  price          :string
#  time_chosen    :time
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  time_chosen_id :integer
#  user_id        :integer
#
class Appointment < ApplicationRecord
  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id")

  validates :massage_type, presence: true
  validates :price, presence: true
  validates :time_chosen, presence: true
  validates :date, presence: true

end
