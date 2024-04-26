# frozen_string_literal: true

require "test_helper"

class CountriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country = countries(:test)
  end

  test "should get index" do
    get admin_countries_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_country_url
    assert_response :success
  end

  test "should create country" do
    assert_difference("Country.count") do
      post admin_countries_url, params: { country: { code: "NCT", name: "New Country" } }
    end

    created_country = Country.find_by(code: "NCT", name: "New Country")
    assert_redirected_to admin_country_url(created_country)
  end

  test "should show country" do
    get admin_country_url(@country)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_country_url(@country)
    assert_response :success
  end

  test "should update country" do
    patch admin_country_url(@country), params: { country: { code: @country.code, name: "Of States United" } }
    assert_redirected_to admin_country_url(@country)
  end

  test "should destroy country" do
    assert_difference("Country.count", -1) do
      delete admin_country_url(@country)
    end

    assert_redirected_to admin_countries_url
  end

  test "should not create invalid country" do
    assert_no_difference("Country.count") do
      post admin_countries_url, params: { country: { code: "", name: "" } }
    end

    assert_response :unprocessable_entity
  end

  test "should not create country with duplicate code" do
    assert_no_difference("Country.count") do
      post admin_countries_url, params: { country: { code: @country.code, name: "Duplicate Country" } }
    end

    assert_response :unprocessable_entity
  end


  test "should not update country with invalid data" do
    patch admin_country_url(@country), params: { country: { code: "", name: "" } }
    assert_response :unprocessable_entity
  end
end
