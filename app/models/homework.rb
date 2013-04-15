class Homework < ActiveRecord::Base
attr_accessible :due_date, :instruction, :user_id, :classroom_id, :grade

has_and_belongs_to_many :questions
has_many :responses
belongs_to :users
belongs_to :classrooms

end
