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

  def register(content_received)
      user = User.find(self.id)
    if user.name.nil? && content_received.match(/name/).nil?
        message = "Looks like you are not registered.  Please text the word 'name' followed by your name to register."
        Text.send_text_to(user.phone, message)
    elsif user.name == nil && content_received.match(/name/)
      user.name = content_received.downcase.split(/name/).delete_if(&:empty?).join(" ").strip
      user.save
      binding.pry
      message = "Thanks #{user.name}, we now have your name."
      Text.send_text_to(user.phone, message)
    end
  end

  def text_homeworks
    user = User.find(self.id)
    if user.homeworks.present?
      message = ""
      user.homeworks.each_with_index do |homework, index|
        message += "#{index + 1}. #{homework.classroom.subject}" + "\n"
      end
      Text.send_text_to(user.phone, message)
    else
      message = "You have no more assignments!"
      Text.send_text_to(user.phone, message)
      session[:state] = nil
    end
  end

end
