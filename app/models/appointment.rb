# == Schema Information
#
# Table name: appointments
#
#  id             :integer          not null, primary key
#  massage_type   :string
#  price          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  time_chosen_id :integer
#  user_id        :integer
#
class Appointment < ApplicationRecord
  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id")

  belongs_to(:time_chosen, :required => true, :class_name => "TimeChosen", :foreign_key => "time_chosen_id")
end
