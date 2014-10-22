require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  should validate_presence_of(:text)
  should validate_presence_of(:user)
  should validate_presence_of(:question)



end
