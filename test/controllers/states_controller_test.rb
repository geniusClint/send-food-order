# frozen_string_literal: true

require "test_helper"

class StatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @state = states(:one)
  end

  test "should get index" do
    get admin_states_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_state_url
    assert_response :success
  end

  test "should create state" do
    assert_difference("State.count") do
      post admin_states_url, params: { state: { code: "NS", country_id: @state.country_id, name: "New State" } }
    end

    created_state = State.find_by(code: "NS", country_id: @state.country_id, name: "New State")
    assert_redirected_to admin_state_url(created_state)
  end

  test "should show state" do
    get admin_state_url(@state)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_state_url(@state)
    assert_response :success
  end

  test "should update state" do
    patch admin_state_url(@state), params: { state: { code: "UC", country_id: @state.country_id, name: @state.name } }
    assert_redirected_to admin_state_url(@state)
  end

  test "should destroy state" do
    assert_difference("State.count", -1) do
      delete admin_state_url(@state)
    end

    assert_redirected_to admin_states_url
  end

  test "should not create invalid state" do
    assert_no_difference("State.count") do
      post admin_states_url, params: { state: { code: "", country_id: "", name: "" } }
    end

    assert_response :unprocessable_entity
  end

  test "should not create state with duplicate code" do
    existing_state = states(:one)
    assert_no_difference("State.count") do
      post admin_states_url, params: { state: { code: existing_state.code, country_id: existing_state.country_id, name: "Duplicate State Code" } }
    end

    assert_response :unprocessable_entity
  end

  test "should not update state with invalid data" do
    patch admin_state_url(@state), params: { state: { code: "", country_id: "", name: "" } }
    assert_response :unprocessable_entity
  end
end
