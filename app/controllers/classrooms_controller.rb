class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @users = @classroom.users
  end
end
