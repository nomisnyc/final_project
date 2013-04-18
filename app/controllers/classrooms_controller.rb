class ClassroomsController < ApplicationController
  def index
    @classrooms = Classroom.all
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.create(params[:classroom])
  end

  def show
    @classroom = Classroom.find(params[:id])
    @students = @classroom.students
  end


end
