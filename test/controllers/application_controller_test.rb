# frozen_string_literal: true

require "test_helper"

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should update user" do
    sign_in users(:customer_one)
    patch user_registration_path(users(:customer_one)), params: { user: { first_name: "Updated", last_name: "User" } }

    assert_response :redirect
  end
end
