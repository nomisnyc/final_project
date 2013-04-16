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
end
