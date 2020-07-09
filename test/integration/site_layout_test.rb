require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    sign_in users(:hector)
  end

  test "check layout links for non-logged in user" do 
    sign_out :user
    get root_path
    assert_template  "posts/index"
    assert_select    "a[href=?]", root_path, count: 2
    assert_select    "a[href=?]", new_user_registration_path
    assert_select    "a[href=?]", new_user_session_path
    assert_select    "a[href=?]", destroy_user_session_path,    count: 0
    assert_select    "a[href=?]", edit_user_registration_path,  count: 0 
    assert_select    "a[href=?]", new_post_path,                count: 0 
  end

  test "check layout links for logged in user" do 
    get root_path
    assert_template  "posts/index"
    assert_select    "a[href=?]", root_path, count: 2
    assert_select    "a[href=?]", new_user_registration_path, count: 0
    assert_select    "a[href=?]", new_user_session_path,      count: 0
    assert_select    "a[href=?]", destroy_user_session_path
    assert_select    "a[href=?]", edit_user_registration_path 
    assert_select    "a[href=?]", post_path(users(:hector).id)
    assert_select    "a[href=?]", new_post_path
  end
  
end
