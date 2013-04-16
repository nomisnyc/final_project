# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  text        :text
#  is_correct  :boolean
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ActiveRecord::Base
  attr_accessible :text, :is_correct

  belongs_to :question

<<<<<<< HEAD
=======
belongs_to :question
>>>>>>> a9ba6bb243db98d109a2de09d358504c32567653
end
