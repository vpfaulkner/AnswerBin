require 'test_helper'

class HomepagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  def valid_question_atts
    {:title => questions(:one).title,
     :text => questions(:one).text,
     :date => questions(:one).date }
  end

  context "GET Index" do
    should "assign a question" do
      get :index

      assert assigns["question"], " Should have a question"
    end
  end

end
