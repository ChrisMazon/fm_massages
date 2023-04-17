# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  body       :string
#  rating     :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  massage_id :integer
#  user_id    :integer
#
class Review < ApplicationRecord
  belongs_to(:user, :required => true, :class_name => "User", :foreign_key => "user_id")
  belongs_to :massage, optional: true

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true
end
