# frozen_string_literal: true

require "test_helper"

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end
end
