require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "non logged in users shouldn't create posts" do 
    get new_post_path
    assert_redirected_to new_user_session_path
  end

  test "non logged in users shouldn't create posts using post" do 
    assert_no_difference 'Post.count' do
      post posts_path, params: { posts: {user_id: 1, post:"testing123"} }
    end
    assert_redirected_to new_user_session_path
  end
end
