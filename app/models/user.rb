# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  admin           :boolean
#  age             :integer
#  email           :string
#  first_name      :text
#  last_name       :text
#  password_digest :string
#  phone_number    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many(:reviews, :class_name => "Review", :foreign_key => "user_id", :dependent => :destroy)

  has_many(:appointments, :class_name => "Appointment", :foreign_key => "user_id", :dependent => :destroy)

  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  validates :age, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
end
