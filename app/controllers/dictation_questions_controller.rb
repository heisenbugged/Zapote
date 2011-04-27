class DictationQuestionsController < ApplicationController
  inherit_resources
  #load_and_authorize_resource
  #before_filter :authenticate_user!
  nested_belongs_to :quiz
  actions :new, :create
  
  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = DictationQuestion.new(params[:dictation_question])
    @quiz.questions << @question
    if @question.save && @quiz.save
      flash[:notice] = 'Successfully created question!'
      redirect_to new_quiz_question_url(@quiz)
    else
      #TODO: Optimize this
      @quiz = Quiz.find(params[:quiz_id])
      render "questions/new"
    end
  end

  def update
    @question = DictationQuestion.find(params[:id])
    if @question.update_attributes(params[:dictation_question])
      flash[:notice] = 'Successfully updated question!'
      redirect_to quiz_url(@question.quiz)
    else
      render "questions/edit"
    end
  end

end
