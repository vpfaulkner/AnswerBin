class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:vote]

  def new

  end

  def create
    @answer = current_user.answers.build(answer_params)
    @question = @answer.question
    if @answer.save
      redirect_to show_questions_path(@question), status: 200
    else
      redirect_to show_questions_path(@question), status: 400
    end
  end

  def index

  end

  def vote

  end

  private

  def set_answer
    @answer = Answer.find(answer_params[:id])
  end

  def answer_params
    params.require(:answer).permit(:text, :user_id, :question_id)
  end

end
