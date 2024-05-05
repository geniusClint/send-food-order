# frozen_string_literal: true

require "test_helper"

class Manage::PhonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phone = phones(:one)
  end

  test "should get index" do
    get manage_phones_url
    assert_response :success
  end

  test "should get new" do
    get new_manage_phone_url
    assert_response :success
  end

  test "should create phone" do
    assert_difference("Phone.count") do
      post manage_phones_url, params: { phone: { country_code: @phone.country_code, number: @phone.number, phonable_id: @phone.phonable_id, phonable_type: @phone.phonable_type, phone_confirmation_token_expiration: @phone.phone_confirmation_token_expiration, phone_confirmed: @phone.phone_confirmed, phone_contirmation_token: @phone.phone_contirmation_token, phone_type: @phone.phone_type } }
    end

    assert_redirected_to manage_phone_url(Phone.order(:created_at).last)
  end

  test "should show phone" do
    get manage_phone_url(@phone)
    assert_response :success
  end

  test "should get edit" do
    get edit_manage_phone_url(@phone)
    assert_response :success
  end

  test "should update phone" do
    patch manage_phone_url(@phone), params: { phone: { country_code: @phone.country_code, number: @phone.number, phonable_id: @phone.phonable_id, phonable_type: @phone.phonable_type, phone_confirmation_token_expiration: @phone.phone_confirmation_token_expiration, phone_confirmed: @phone.phone_confirmed, phone_contirmation_token: @phone.phone_contirmation_token, phone_type: @phone.phone_type } }
    assert_redirected_to manage_phone_url(@phone)
  end

  test "should destroy phone" do
    assert_difference("Phone.count", -1) do
      delete manage_phone_url(@phone)
    end

    assert_redirected_to manage_phones_url
  end
end
