require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:email)
  should validate_presence_of(:score)
  should validate_numericality_of(:score)
         .only_integer
         .is_greater_than_or_equal_to(0)
end
