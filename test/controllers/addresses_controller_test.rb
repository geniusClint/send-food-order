# frozen_string_literal: true

require "test_helper"

class Manage::AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get manage_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_manage_address_url
    assert_response :success
  end

  test "should create address" do
    assert_difference("Address.count") do
      post manage_addresses_url, params: { address: { address_type: @address.address_type, address1: @address.address1, address2: @address.address2, suite: @address.suite, city: @address.city, state_id: @address.state_id, zipcode: @address.zipcode, addressable_id: @address.addressable_id, addressable_type: @address.addressable_type } }
    end

    assert_redirected_to manage_address_url(Address.order(:created_at).last)
  end

  test "should show address" do
    get manage_address_url(@address)
    assert_response :success
  end

  test "should get edit" do
    get edit_manage_address_url(@address)
    assert_response :success
  end


  test "should update address" do
    patch manage_address_url(@address), params: { address: { address_type: @address.address_type, address1: "Updated Address", address2: @address.address2, suite: @address.suite, city: @address.city, state_id: @address.state_id, zipcode: @address.zipcode, addressable_id: @address.addressable_id, addressable_type: @address.addressable_type } }
    assert_redirected_to manage_address_url(Address.find(@address.id))

    updated_address = Address.find(@address.id)
    assert_equal "Updated Address", updated_address.address1
  end

  test "should destroy address" do
    assert_difference("Address.count", -1) do
      delete manage_address_url(@address)
    end

    assert_redirected_to manage_addresses_url
  end
end
