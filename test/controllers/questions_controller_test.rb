require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  def valid_question_atts
    {:title => questions(:one).title,
     :text => questions(:one).text,
     :date => questions(:one).date }
  end

  def invalid_question_atts
    {:title => "",
     :text => "",
     :date => "" }
  end

  context "POST CREATE" do
    context "with valid information" do
      should "create question" do
        post :create, { question: valid_question_atts }

        # assert_response 200, "  Question response should be 200"
        assert assigns["question"], " Should have a question"
        assert assigns["question"].persisted?, " Question should be in database"
        assert_equal valid_question_atts[:title], assigns["question"].title, "  Question should have same title"
      end
    end

    context "without valid information" do
      should "not create question" do
        post :create, { question: invalid_question_atts }

        # assert_response 400, "  Question response should be 400"
      end
    end

  end

end
