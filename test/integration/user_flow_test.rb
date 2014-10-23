require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  context "Homepage Index" do

    should "see question of the day" do
      visit root_path
      assert page.has_content?("Question of the Day"), "Should see the question of the day"
    end

    context "when not logged in" do
      should "see login in the navbar" do
        visit root_path
        assert page.has_content?("Login"), "Should have loging link"
      end
    end

    context "when logged in" do
      setup do
        visit new_user_session_path
        fill_in "Email", with: users(:one).email
        fill_in "Password", with: default_password
        click_button "Log in"
      end

      teardown do
        click_link('Logout')
      end

      should "see logout in the navbar" do
        assert_equal root_path, current_path
        assert page.has_content?("Logout"), "Should see logout link"
      end

      should "be able to submit an answer to question of the day" do
        fill_in "Text", with: "Here is my answer"
        click_button "Create Answer"

        assert page.has_content?("Here is my answer"), "Answer should be displayed"
      end

    end

    context "when not logged in" do
      should "not be able to submit an answer to question of the day" do

      end
    end

  end

end
