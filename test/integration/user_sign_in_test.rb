require 'test_helper'

class UserSignInTest < ActionDispatch::IntegrationTest
  test "Sign up with invalid data" do
    get new_user_session_path
    assert_template 'devise/sessions/new'
    post user_session_path, params: {session: {email: "", password: ""}}
    assert_template 'devise/sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
