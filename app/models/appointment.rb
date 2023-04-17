# == Schema Information
#
# Table name: appointments
#
#  id          :integer          not null, primary key
#  date        :datetime
#  time_chosen :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  massage_id  :integer
#  user_id     :integer
#
class Appointment < ApplicationRecord
  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id")

  belongs_to :massage

  validates :time_chosen, presence: true
  validates :date, presence: true
end
