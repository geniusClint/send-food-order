# frozen_string_literal: true

require "application_system_test_case"

class PhonesTest < ApplicationSystemTestCase
  setup do
    @phone = phones(:one)
  end

  test "visiting the index" do
    visit phones_url
    assert_selector "h1", text: "Phones"
  end

  test "should create phone" do
    visit phones_url
    click_on "New phone"

    fill_in "Country code", with: @phone.country_code
    fill_in "Number", with: @phone.number
    fill_in "Phonable", with: @phone.phonable_id
    fill_in "Phonable type", with: @phone.phonable_type
    fill_in "Phone confirmation token expiration", with: @phone.phone_confirmation_token_expiration
    check "Phone confirmed" if @phone.phone_confirmed
    fill_in "Phone contirmation token", with: @phone.phone_contirmation_token
    fill_in "Phone type", with: @phone.phone_type
    click_on "Create Phone"

    assert_text "Phone was successfully created"
    click_on "Back"
  end

  test "should update Phone" do
    visit phone_url(@phone)
    click_on "Edit this phone", match: :first

    fill_in "Country code", with: @phone.country_code
    fill_in "Number", with: @phone.number
    fill_in "Phonable", with: @phone.phonable_id
    fill_in "Phonable type", with: @phone.phonable_type
    fill_in "Phone confirmation token expiration", with: @phone.phone_confirmation_token_expiration
    check "Phone confirmed" if @phone.phone_confirmed
    fill_in "Phone contirmation token", with: @phone.phone_contirmation_token
    fill_in "Phone type", with: @phone.phone_type
    click_on "Update Phone"

    assert_text "Phone was successfully updated"
    click_on "Back"
  end

  test "should destroy Phone" do
    visit phone_url(@phone)
    click_on "Destroy this phone", match: :first

    assert_text "Phone was successfully destroyed"
  end
end
