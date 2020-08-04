class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @topics = Topic.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to question_path(@question)
    else
      redirect_to questions_path, alert: @question.errors.full_messages
    end
  end

  private
  def question_params
    params.require(:question).permit(:question, :topic_id)
  end
end
