# == Schema Information
#
# Table name: homeworks
#
#  id           :integer          not null, primary key
#  instruction  :text
#  user_id      :integer
#  classroom_id :integer
#  grade        :string(255)
#  due_date     :date
#  random       :string(255)
#

class Homework < ActiveRecord::Base
  attr_accessible :due_date, :instruction, :grade, :user_id, :classroom_id
  before_create :generate_random

  has_and_belongs_to_many :questions
  has_many :responses
  belongs_to :user
  belongs_to :classroom

  def text
    Text.send_text_to(user, body)
  end

  def self.find_by_message(message)
    a = message.match(/only:.+/).to_s.split("")
    a.shift(6)
    random = a.join
    Assignment.find_by_random(random)
  end

  def generate_random
    self.random = SecureRandom.hex(5)
  end

end
