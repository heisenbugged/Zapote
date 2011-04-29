class MultipleChoiceQuestionsController < ApplicationController
  inherit_resources

  #load_and_authorize_resource
  #before_filter :authenticate_user!
  
  belongs_to :quiz, :optional => true
  actions :new, :create, :update
  
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
  def update
    update! { quiz_path(@multiple_choice_question.quiz) }
  end
end
