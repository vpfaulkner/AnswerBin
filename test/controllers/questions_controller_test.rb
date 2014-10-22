require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  def valid_question
    {:title => questions(:one).title,
     :text => questions(:one).text,
     :date => questions(:one).date }
  end

  def invalid_question
    {:title => "",
     :text => "",
     :date => "" }
  end

  context "POST CREATE" do
    context "with valid information" do
      should "create question" do
        post :create, { question: valid_question }

        assert_response 200
        assert assigns["question"], "Should have a question"
        assert assigns["question"].persisted?
        assert_equal valid_question[:title], assigns["question"].title
      end
    end

    context "without valid information" do
      should "not create question" do
        post :create, { question: invalid_question }

        assert_response 400
      end
    end

  end
end
