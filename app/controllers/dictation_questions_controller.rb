class DictationQuestionsController < ApplicationController
  inherit_resources  
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
end
