# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  is_teacher      :boolean
#  password_digest :string(255)
#  address         :text
#  phone           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

  attr_accessible :name, :email, :phone, :address, :password, :password_confirmation, :is_teacher
  
  has_secure_password
  has_many :homeworks
  has_and_belongs_to_many :classrooms

end
