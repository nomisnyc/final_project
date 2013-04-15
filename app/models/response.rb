class Response < ActiveRecord::Base
attr_accessible :question_id, :asnwer, :is_correct, :homework_id
has_many :questions
belongs_to :homeworks
end