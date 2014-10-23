require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  should validate_presence_of(:text)
  should validate_presence_of(:user)
  should validate_presence_of(:question)

  should "know it's own score" do
    answer = answers(:one)
    voter1 = users(:one)
    voter2 = users(:two)
    answer.votes.create!(value: 1, user: voter1)
    answer.votes.create!(value: 1, user: voter2)

    assert_equal 2, answer.score
  end

end
