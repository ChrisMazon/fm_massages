# == Schema Information
#
# Table name: time_chosens
#
#  id         :integer          not null, primary key
#  time       :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class TimeChosen < ApplicationRecord
  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id")

  has_many(:appointments, :class_name => "Appointment", :foreign_key => "time_chosen_id", :dependent => :destroy)
end
