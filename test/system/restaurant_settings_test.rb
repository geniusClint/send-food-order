# frozen_string_literal: true

require "application_system_test_case"

class RestaurantSettingsTest < ApplicationSystemTestCase
  setup do
    @restaurant_setting = restaurant_settings(:one)
  end

  test "visiting the index" do
    visit restaurant_settings_url
    assert_selector "h1", text: "Restaurant settings"
  end

  test "should create restaurant setting" do
    visit restaurant_settings_url
    click_on "New restaurant setting"

    fill_in "Day start time", with: @restaurant_setting.day_start_time
    fill_in "Notification email", with: @restaurant_setting.notification_email
    check "Notify email" if @restaurant_setting.notify_email
    fill_in "Order cutoff minutes", with: @restaurant_setting.order_cutoff_minutes
    fill_in "Reporting code", with: @restaurant_setting.reporting_code
    fill_in "Restaurant", with: @restaurant_setting.restaurant_id
    fill_in "Tax rate", with: @restaurant_setting.tax_rate
    fill_in "Timezone", with: @restaurant_setting.timezone
    fill_in "Website", with: @restaurant_setting.website
    click_on "Create Restaurant setting"

    assert_text "Restaurant setting was successfully created"
    click_on "Back"
  end

  test "should update Restaurant setting" do
    visit restaurant_setting_url(@restaurant_setting)
    click_on "Edit this restaurant setting", match: :first

    fill_in "Day start time", with: @restaurant_setting.day_start_time
    fill_in "Notification email", with: @restaurant_setting.notification_email
    check "Notify email" if @restaurant_setting.notify_email
    fill_in "Order cutoff minutes", with: @restaurant_setting.order_cutoff_minutes
    fill_in "Reporting code", with: @restaurant_setting.reporting_code
    fill_in "Restaurant", with: @restaurant_setting.restaurant_id
    fill_in "Tax rate", with: @restaurant_setting.tax_rate
    fill_in "Timezone", with: @restaurant_setting.timezone
    fill_in "Website", with: @restaurant_setting.website
    click_on "Update Restaurant setting"

    assert_text "Restaurant setting was successfully updated"
    click_on "Back"
  end

  test "should destroy Restaurant setting" do
    visit restaurant_setting_url(@restaurant_setting)
    click_on "Destroy this restaurant setting", match: :first

    assert_text "Restaurant setting was successfully destroyed"
  end
end
