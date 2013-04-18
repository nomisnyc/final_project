# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  text          :string(255)
#  assignment_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Question < ActiveRecord::Base
  attr_accessible :text
   has_and_belongs_to_many :homeworks
   belongs_to :response
   belongs_to :assignment
   has_many :answers

  def send_question(user)
    question_text = self.text
    response_text = ""
    self.answers.each_with_index do |answer, index|
      response_text += "  #{(65 + index).chr}. " + answer.text + "\n"
    end
    message = question_text + "\n" + response_text
    Text.send_text_to(user.phone, message)
  end

  def next
    self.class.where("#{self.class.table_name}.id > ?", self.id).first
  end
end
