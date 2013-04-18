class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @users = @classroom.users
  end

  def assign
    @classroom = Classroom.find(params[:classroom_id])
    @assignment = Assignment.find(params[:assignment_id])
    @questions = @assignment.questions
    @classroom.students.each do |student|
      homework = Homework.create(user_id: student.id, classroom_id: @classroom.id)
      homework.questions = @assignment.questions
      homework.save
      body = "You have a new homework from your #{@classroom.subject} class. Text projects to access this homework."
      Text.send_text_to(student.phone, body)
    end
  end
end


