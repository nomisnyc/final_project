class Classroom < ActiveBase::Record
attr_accessible :subject, :teacher_id
has_many :homeworks
has_and_belongs_to_many :users
end
