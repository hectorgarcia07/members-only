require 'test_helper'

class PostEditTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:hector)
  end

  test "non logged in user shouldn't be able access edit post page" do
    sign_out :user
    get edit_post_path(1)
    assert_redirected_to root_url
  end

  test "logged in user should be able to edit their own post" do
    get edit_post_path(users(:hector).posts.first.id)
    assert_response :success
  end

  test "logged in user shouldn't be able to edit other persons post" do
    get edit_post_path(users(:garcia).posts.first.id)
    assert_redirected_to root_url
  end
end
