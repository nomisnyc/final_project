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
attr_accessible :text, :assignment_id
has_and_belongs_to_many :tags
has_and_belongs_to_many :homeworks
belongs_to :responses
has_many :answers
belongs_to :assignments

end
