require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup 
    @user = User.new(email: "test@test.com", password: "testing123",
                     username: "testing")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "username should not be longer than 50 characters" do
    username_var = "a" * 51;
    @user.username = username_var
    assert_not @user.valid?
  end

  test "user should have unique email" do
    user_var = @user.dup
    user_var.username = "stuff"
    user_var.email = @user.email.upcase
    @user.save
    assert_not user_var.valid?
  end

  test "user should have unique username" do
    user_var = @user.dup
    user_var.email = "stuff@test.com"
    user_var.username = @user.username
    @user.save
    assert_not user_var.valid?
  end
  
  # Tesing for emptyness

  test "username should not be empty" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "password should not be empty" do
    @user.password = " "
    assert_not @user.valid?
  end

  test "email should not be empty" do
    @user.email = " "
    assert_not @user.valid?
  end
end
