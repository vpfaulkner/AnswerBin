class HomepagesController < ApplicationController
  def index
    @question = Question.last
    @answer = Answer.new
  end
end
