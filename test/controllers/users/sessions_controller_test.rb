# frozen_string_literal: true

require "test_helper"

class Users::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_session_path
    assert_response :success
  end

  test "user can login" do
    get new_user_session_path
    sign_in users(:customer_one)

    assert_response :success
  end

  test "should delete destroy" do
    delete destroy_user_session_path
    assert_redirected_to root_path
  end
end
