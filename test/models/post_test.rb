require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "test@test.com", password: "testing123",
                     username: "testing")
  end

  test "post created should be valid" do
    @user.posts.new(post: "testing")
    assert @user.posts.last.valid?
  end

  test "post should not be empty" do
    @user.posts.new(post: "   ")
    assert_not @user.posts.last.valid?
  end

  test "post should not be more than 255 characters long" do
    post_var = "a" * 256
    @user.posts.new(post: post_var)
    assert_not @user.posts.last.valid?
  end
end
