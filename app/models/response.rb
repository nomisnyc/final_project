# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  answer      :string(255)
#  is_correct  :boolean
#  homework_id :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Response < ActiveRecord::Base
  attr_accessible :answer, :is_correct, :homework_id, :question_id
  belongs_to :question
  belongs_to :homework

  def is_correct?
    index = self.answer.upcase[0].ord - 65
    if self.question.answers[index].is_correct == true
      true
    else
      false
    end
  end
end
