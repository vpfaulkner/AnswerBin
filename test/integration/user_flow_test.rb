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
        assert page.has_content?("Login"), "No login when not logged in"
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

      should "be able to submit an answer to question of the day" do

      end

      should "see name in the navbar" do
        assert_equal root_path, current_path
        assert page.has_content?("Logout"), "Not logged in properly"
      end
    end

  end

end
