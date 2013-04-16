# == Schema Information
#
# Table name: homeworks
#
#  id           :integer          not null, primary key
#  instruction  :text
#  user_id      :integer
#  classroom_id :integer
#  grade        :string(255)
#  due_date     :date
#

class Homework < ActiveRecord::Base
attr_accessible :due_date, :instruction, :grade

has_and_belongs_to_many :questions
has_many :responses
belongs_to :user
belongs_to :classroom

end
