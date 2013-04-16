class QuestionsController < ApplicationController
  def create
    @assignment = Assignment.find(params[:assignment_id])
    @question = Question.create(params[:question])
    @assignment.questions << @question
    @answer = Answer.new
  end
end
