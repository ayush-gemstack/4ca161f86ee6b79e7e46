class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params.merge(user: current_user))
    if @answer.save
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question), alert: @answer.errors.full_messages
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:answer)
  end
end
