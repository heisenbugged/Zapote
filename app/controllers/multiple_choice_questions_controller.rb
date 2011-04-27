class MultipleChoiceQuestionsController < ApplicationController
  inherit_resources

  #load_and_authorize_resource
  #before_filter :authenticate_user!
  
  nested_belongs_to :quiz
  actions :new, :create
  
  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = MultipleChoiceQuestion.new(params[:multiple_choice_question])
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
