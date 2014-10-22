class HomepagesController < ApplicationController
  def index
    @question = Question.last
  end
end
