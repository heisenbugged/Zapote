class QuizzesController < ApplicationController
  inherit_resources
  #load_and_authorize_resource
  before_filter :authenticate_user!
  respond_to :html, :xml
  actions :index, :create, :edit, :update, :show
  
  def edit
    @quiz = Quiz.find(params[:id])
    
    @question = MultipleChoiceQuestion.new

    4.times { @question.choices.new }
    #@new_quiz = Quiz.new
    #@new_quiz.questions =MultipleChoiceQuestion.new]
  end
  def create
    create! { new_quiz_question_url(@quiz) }
  end
  def update
    update! { quizzes_path }
  end
  def take
    @quiz = Quiz.find(params[:id])
  end
end
