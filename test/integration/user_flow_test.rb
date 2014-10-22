require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  context "Homepage Index" do

    context "when not logged in" do
      should "see login in the navbar" do
        visit root_path
        assert page.has_content?("Login"), "  No login when not logged in"
      end
    end

    # context "when logged in" do
    #   should "see name in the navbar" do
    #     visit new_user_session_path
    #     puts page.body
    #     fill_in('Email', :with => "vpfaulkner@gmail.com")
    #     fill_in('Password', :with => "password")
    #     click_on('Log in')
    #     assert_equal root_path, current_path
    #     assert page.has_content?("Logout"), "  Not logged in properly"
    #   end
    # end

  end

end
