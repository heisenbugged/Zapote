class TextQuestionsController < ApplicationController
  inherit_resources
  nested_belongs_to :quiz

  actions :new, :create

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = TextQuestion.new(params[:text_question])
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
    @question = TextQuestion.find(params[:id])
    if @question.update_attributes(params[:text_question])
      flash[:notice] = 'Successfully updated question!'
      redirect_to quiz_url(@question.quiz)
    else
      render "questions/edit"
    end
  end
end
