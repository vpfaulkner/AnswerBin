require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  should validate_presence_of(:user)
  should validate_presence_of(:value)
  should validate_presence_of(:answer)


end
