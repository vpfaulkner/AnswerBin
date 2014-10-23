require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  def valid_answer_atts
    {:text => answers(:one).text,
    :user_id => answers(:one).user.id,
    :question_id => answers(:one).question.id }
  end

  def invalid_answer_atts
    {:text => "",
    :user_id => "",
    :question_id => answers(:one).question.id }
  end

  context "GET Create" do

    context "When logged in" do

      context "with valid atts" do
        should "create the answer" do
          @user = users(:one)
          sign_in @user
          post :create, { answer: valid_answer_atts }

          # assert_response 200, "Response should be 200"
          assert assigns["answer"], "Should have an answer"
          assert assigns["answer"].persisted?, "Answer should be in database"
          assert_equal valid_answer_atts[:text], assigns["answer"].text, "Answer should have same text"
        end
      end

      context "with invalid atts" do
        should "not create the answer" do
          @user = users(:one)
          sign_in @user
          post :create, { answer: invalid_answer_atts }

          # assert_response 400, "Response should be 400"
          assert assigns["answer"], "Should have an answer"
          assert_not assigns["answer"].persisted?, "Answer should be in database"
        end
      end

    end

    context "When not logged in" do

    end

  end

  context "POST Vote" do
    should "recieve votes" do
      @user = users(:one)
      sign_in @user
      post :vote, { id: answers(:one), vote: { value: 1 } }

      assert_equal 1, answers(:one).score, "Answer score should equal 1"
    end
  end
end
