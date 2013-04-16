class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.create(params[:assignment])
    @assignment.tags = Tag.add(params[:tags].split(','))
    @assignment.save
    @question = Question.new
  end

end
