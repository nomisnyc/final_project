# == Schema Information
#
# Table name: classrooms
#
#  id         :integer          not null, primary key
#  subject    :string(255)
#  teacher_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Classroom < ActiveRecord::Base
attr_accessible :subject, :teacher_id

has_many :homeworks
has_and_belongs_to_many :users
end
