# == Schema Information
#
# Table name: appointments
#
#  id          :integer          not null, primary key
#  date        :datetime
#  status      :string           default("upcoming")
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

  enum status: { upcoming: "upcoming", today: "today", done: "done" }
  
  before_save :set_status_today_if_appointment_is_today

  def set_status_today_if_appointment_is_today
    self.status = "today" if date == Date.today
  end

  def update_status_if_past_appointment
    if date.past? && (upcoming? || today?)
      update(status: "done")
    end
  end
end
