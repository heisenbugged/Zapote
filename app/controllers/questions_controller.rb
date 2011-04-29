class QuestionsController < ApplicationController
  inherit_resources
  load_and_authorize_resource
  before_filter :authenticate_user!
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
