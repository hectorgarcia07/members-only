require 'test_helper'

class DeletePostTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:hector)
  end

  test "user should be able to delete their own post" do
    assert_difference "users(:hector).posts.count", -1 do
      delete post_path(1)
    end

  end
end
