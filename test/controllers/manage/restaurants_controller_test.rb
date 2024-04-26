# frozen_string_literal: true

require "test_helper"

class Manage::RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get manage_restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_manage_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference("Restaurant.count") do
      post manage_restaurants_url, params: { restaurant: { city: @restaurant.city, state_id: @restaurant.state.id, location_name: "Another Location", name: "Another Restaurant", slug: "another-restaurant-another-location-city-one-tx" } }
    end

    created_restaurant = Restaurant.find_by(slug: "another-restaurant-another-location-city-one-tx")
    assert_redirected_to manage_restaurant_url(created_restaurant)
  end

  test "should show restaurant" do
    get manage_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_manage_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    patch manage_restaurant_url(@restaurant), params: { restaurant: { city: @restaurant.city, state_id: @restaurant.state.id, location_name: @restaurant.location_name, name: "Changed Name" } }

    changed_restaurant = Restaurant.find_by(slug: "changed-name-mystring-city-one-tx")
    assert_redirected_to manage_restaurant_url(changed_restaurant)
  end

  test "should destroy restaurant" do
    assert_difference("Restaurant.count", -1) do
      delete manage_restaurant_url(@restaurant)
    end

    assert_redirected_to manage_restaurants_url
  end
end
