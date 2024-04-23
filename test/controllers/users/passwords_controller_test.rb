# frozen_string_literal: true

require "test_helper"

class Users::PasswordsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_password_path
    assert_response :success
  end

  test "should get edit" do
    get edit_user_password_path
    assert_response :redirect
  end
end
