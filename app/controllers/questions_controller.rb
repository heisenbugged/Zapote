class QuestionsController < ApplicationController
  inherit_resources
  actions :delete, :destroy, :edit
  
  include QuestionsHelper 
  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.new
  end
  def destroy
    destroy! {quiz_path(@question.quiz)}
  end
  def edit
    edit! { @quiz = @question.quiz }
  end
end
