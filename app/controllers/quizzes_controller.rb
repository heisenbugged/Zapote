class QuizzesController < ApplicationController
  inherit_resources
  load_and_authorize_resource  
  before_filter :authenticate_user!
  respond_to :html, :xml
  actions :index, :create, :edit, :update, :show
  def index
    index!
  end
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
  def reassign
    # Only reassign if questions were selected
    unless params[:assignees].blank?
      # Quiz that is gaining the questions
      receiving_quiz = Quiz.where(:number => params[:receiving_id]).first
      unless receiving_quiz.nil?
        # Grab question id's from assign parameters and reassign their quiz id.
        params[:assignees].each do |question_id|
          question = Question.find(question_id)
          question.quiz = receiving_quiz
          question.save!
        end
        flash[:notice] = params[:assignees].count.to_s + " questions reassigned successfully."
        # redirect to quiz that received all the questions
        redirect_to quiz_url(receiving_quiz)
      else
        flash[:alert] = "You must enter a quiz ID for reassignment."
        redirect_to quiz_url(params[:id])
      end
    else
      flash[:alert] = "You must select at least one question to reassign."
      redirect_to quiz_url(params[:id])
    end
  end  
end
