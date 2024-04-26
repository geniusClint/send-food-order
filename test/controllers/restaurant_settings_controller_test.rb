# frozen_string_literal: true

require "test_helper"

class RestaurantSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
    @restaurant_setting = restaurant_settings(:one)
  end



  test "should show restaurant_setting" do
    get manage_restaurant_setting_url(@restaurant_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_manage_restaurant_setting_url(@restaurant_setting)
    assert_response :success
  end

  test "should update restaurant_setting" do
    patch manage_restaurant_setting_url(@restaurant_setting), params: { restaurant_setting: { day_start_time: @restaurant_setting.day_start_time, notification_email: @restaurant_setting.notification_email, notify_email: @restaurant_setting.notify_email, order_cutoff_minutes: @restaurant_setting.order_cutoff_minutes, reporting_code: @restaurant_setting.reporting_code, restaurant_id: @restaurant_setting.restaurant_id, tax_rate: @restaurant_setting.tax_rate, timezone: @restaurant_setting.timezone, website: "changed website" } }
    assert_redirected_to manage_restaurant_setting_url(@restaurant_setting)
  end
end
