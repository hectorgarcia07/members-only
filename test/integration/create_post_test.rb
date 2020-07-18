require 'test_helper'

class CreatePostTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:hector)
  end

  test "non logged in users shouldn't access create post page" do 
    sign_out :user
    get new_post_path
    assert_redirected_to root_url
  end

  test "logged in users should access create post page" do
    get new_user_session_path
    assert_template 'devise/sessions/new'
  end

  test "logged in user should be able to create a post" do
    assert_difference 'users(:hector).posts.count', 1 do
      post posts_path, params: { post: {post: "Stuff"}}
    end
  end

  test "non logged in users shouldn't create posts using post" do 
    sign_out :user
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: {user_id: 1, post:"testing123"} }
    end
  end
end
