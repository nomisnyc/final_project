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
attr_accessible :answer, :is_correct
belongs_to :question
belongs_to :homework
end
