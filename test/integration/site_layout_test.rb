require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "check layout links for non-logged in user" do 
    get root_path
    assert_template  "posts/index"
    assert_select    "a[href=?]", root_path, count: 2
    assert_select    "a[href=?]", new_user_registration_path
    assert_select    "a[href=?]", new_user_session_path
  end
  
end
