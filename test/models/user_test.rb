# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user is valid with valid attributes" do
    user = User.new(
      first_name: "John",
      last_name: "Doe",
      email: "john@example.com",
      password: "password123",
      password_confirmation: "password123"
    )

    assert_predicate user, :valid?
  end

  test "user is not valid without name" do
    user = User.new(first_name: nil)
    assert_not user.valid?
    assert_not_nil user.errors[:first_name]
  end

  test "user is not valid without email" do
    user = User.new(email: nil)
    assert_not user.valid?
    assert_not_nil user.errors[:email]
  end

  test "user is not valid with invalid email format" do
    invalid_emails = ["user@example", "@example.com"]
    invalid_emails.each do |invalid_email|
      user = User.new(email: invalid_email)
      assert_not user.valid?, "#{invalid_email} should be invalid"
      assert_not_nil user.errors[:email]
    end
  end

  test "email is unique and case insensitive" do
    duplicate_user = users(:customer_one)
    user = User.new(
      first_name: "Test",
      last_name: "User",
      email: duplicate_user.email.upcase
    )

    assert_not user.valid?
    assert_not_nil user.errors[:email]
  end

  test "password should be present" do
    user = User.new(password: nil)
    assert_not user.valid?
    assert_not_nil user.errors[:password]
  end

  test "password should be at least 6 characters" do
    user = User.new(password: "12345")
    assert_not user.valid?
    assert_not_nil user.errors[:password]
  end

  test "password confirmation should match password" do
    user = User.new(
      password: "password123",
      password_confirmation: "password456"
    )
    assert_not user.valid?
    assert_not_nil user.errors[:password_confirmation]
  end
end
