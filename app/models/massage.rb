# == Schema Information
#
# Table name: massages
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :string
#  name        :string
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Massage < ApplicationRecord

  has_many(:appointments, :class_name => "Appointment", :foreign_key => "massage_id", :dependent => :destroy)
  has_many :reviews

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true
end
