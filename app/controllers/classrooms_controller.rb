class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @users = @classroom.users
  end

  def assign
    @classroom = Classroom.find(params[:classroom_id])
    @assignment = Assignment.find(params[:assignment_id])
    @classroom.students.each do |student|
      homework = Homework.create(user_id: student.id, classroom_id: @classroom.id)
      homework.text
    end
  end
end
