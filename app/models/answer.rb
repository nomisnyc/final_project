class Answer < ActiveRecord::Base
attr_accessible :text, :is_correct, :question_id

belongs_to :questions
end
