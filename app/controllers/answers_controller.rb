class AnswersController < ApplicationController
  before_action :authenticate_user!

  def new

  end

  def create
    @answer = current_user.answers.build(answer_params)
    @question = @answer.question
    if @answer.save
      if @question = Question.last
        redirect_to root_path
      else
        redirect_to show_questions_path(@question)
      end
    else
      redirect_to show_questions_path(@question)
    end
  end

  def index

  end

  def vote
    @answer = Answer.find_by(id: params[:id])
    @question = @answer.question
    @vote = @answer.votes.build(user: current_user, value: params[:vote][:value])
    if @answer.save
      if @question = Question.last
        redirect_to root_path
      else
        redirect_to show_questions_path(@question)
      end
    else
      redirect_to show_questions_path(@question)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text, :user_id, :question_id)
  end

end
