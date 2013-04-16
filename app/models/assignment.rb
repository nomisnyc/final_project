# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  description :string(255)
#  subject     :string(255)
#  source_type :string(255)
#  source_id   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Assignment < ActiveRecord::Base
attr_accessible :description, :subject, :source_type, :source_id

belongs_to :questions
end
