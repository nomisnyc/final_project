class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @users = @classroom.users
  end

  def new
    @classroom = Classroom.new
  end

  def create
    @classroom = Classroom.create(params[:classroom])
  end


end
