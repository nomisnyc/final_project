class AnswersController < ApplicationController
  def new
  end

  def create
    @current_answer = Answer.create(params[:answer])
    @question = Question.find(params[:question_id])
    @current_answer.question = @question
    @assignment = @question.assignment
    @answer = Answer.new
  end
end