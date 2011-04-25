class QuestionsController < ApplicationController
  include QuestionsHelper 
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.new
  end
end
