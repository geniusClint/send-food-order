# frozen_string_literal: true

require "test_helper"

class Users::ConfirmationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_confirmation_url
    assert_response :success
  end
end
