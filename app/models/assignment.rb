class Assignment < ActiveRecord::Base
attr_accessible :description, :subject, :source_type, :source_id

belongs_to :questions
end
