class QuestionsController < ApplicationController

  def new

  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, status: 200
    else
      redirect_to root_path, status: 400
    end
  end

  def index

  end

  def show

  end

  private

  def set_question

  end

  def question_params
    params.require(:question).permit(:title, :text, :date)
  end
end
