# frozen_string_literal: true

require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:customer_one)
    @address = addresses(:one)
  end

  test "should get index" do
    get addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_address_url
    assert_response :success
  end

  test "should create address" do
    assert_difference("Address.count") do
      post addresses_url, params: { address: { address1: "This Test Address", address2: @address.address2, address_type: @address.address_type, city: @address.city, state_id: @address.state_id, suite: @address.suite, zipcode: @address.zipcode } }
    end

    created_address = Address.find_by(address1: "This Test Address")
    assert_redirected_to address_url(created_address)
  end

  test "should show address" do
    get address_url(@address)
    assert_response :success
  end

  test "should get edit" do
    get edit_address_url(@address)
    assert_response :success
  end

  test "should update address" do
    patch address_url(@address), params: { address: { address1: "Updated", address2: @address.address2, address_type: @address.address_type, city: @address.city, state_id: @address.state_id, suite: @address.suite, zipcode: @address.zipcode } }
    assert_redirected_to address_url(@address)
  end

  test "should destroy address" do
    assert_difference("Address.count", -1) do
      delete address_url(@address)
    end

    assert_redirected_to addresses_url
  end

  test "should not create invalid address" do
    assert_no_difference("Address.count") do
      post addresses_url, params: { address: { address1: "", address2: "", address_type: "", city: "", state_id: "", suite: "", zipcode: "" } }
    end

    assert_response :unprocessable_entity
  end

  test "should not update invalid address" do
    patch address_url(@address), params: { address: { address1: "", address2: "", address_type: "", city: "", state_id: "", suite: "", zipcode: "" } }
    assert_response :unprocessable_entity
  end
end
