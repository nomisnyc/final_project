class HomeworksController < ApplicationController

  def create

  end

  def start
    @classroom = Classroom.find(params[:classroom_id])
    @assignment = Assignment.find(params[:assignment_id])
    Homework.create(user: @auth.id, classroom: @classroom.id)
    body = @homework.generate_prompt
    @classroom.students.each do |student|
      Text.send_text_to(student, body)
    end
  end

end
